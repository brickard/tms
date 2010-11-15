# A hacked at version of the Presenter Pattern as described here:
# http://blog.jayfields.com/2007/03/rails-presenter-pattern.html
# and pastied here:
# http://pastie.org/47453

module Presentable

  module SegmentableBehavior

    def self.included(base)
      base.extend(ClassMethods)
      base.include(InstanceMethods)
    end

    module ClassMethods

      def segmentable(presentable_name, name, count)
        raise "No presentable named #{presentable_name} found" unless presentables.key? presentable_name
        raise "Presentable #{presentable_name} does not have a #{name} attribute" unless presentables[presentable_name].column_names.include?(name.to_s)
        segmentables[name.to_sym] = presentable_name, count.to_i
        (1..count.to_i).each do |i|
          attr_accessor "#{name}_#{i}".to_sym
        end
      end

      def segmentables
        @segmentables ||= {}
      end

    end # ClassMethods

    module InstanceMethods

      def merge_segementables
        self.class.segmentables.each_pair do |name, opts|
          presentable_name, count = opts
          value = count.to_i.times.map { |i| self.send("#{name}_#{i+1}") }.join
          self.send("#{name}=", value) unless value.blank?
        end
      end

    end # InstanceMethods


  end # SegmentableBehavior

  module PresentableBehavior
    def self.included(base)
      base.extend(ClassMethods)
    end

    def initialize(options={})
      options = options.symbolize_keys
      self.class.presentables.each_pair do |name, model|
        self.initialize_presentable(name, model, options)
      end
    end

    def initialize_presentable(name, model, options)
      model_opts = self.search_for_options(name, options) || {}
      where_opts = model_opts.reject { |k,v| 
        ( !model.column_names.include?(k.to_s) || v.blank? )
      }
      unless model_opts.key?(:id)
        model_instance = model.where(where_opts).first unless where_opts.blank?
        model_instance = model.new(model_opts) if model_instance.blank?
      else
        model_instance = model.find(model_opts.delete(:id))
      end
      model_opts.each_pair do |k,v|
        model_instance.send("#{k}=", v)
      end
      self.send("#{name}_model_options=".to_sym, model_opts)
      self.send("#{name}_where_options=".to_sym, where_opts)
      self.send("#{name}=".to_sym, model_instance)
    end

    def save!
      self.save(:save!)
    end

    def save(meth=:save)
      results = {}
      self.class.presentables.each_pair do |name, model|
        instance = self.send(name.to_sym)
        res = instance.send(meth.to_sym) if instance.changed?
        results[instance] = res
      end
      if results.values.include?(false)
        results.map { |k,v| k.destroy if k.new_record? }
        return false
      end
      return true
    end

    def errors
      errors = []
      self.class.presentables.each_pair do |name, model|
        instance = self.send(name.to_sym)
        unless (instance.blank? || instance.errors.blank?)
          instance.errors.full_messages.each do |msg|
            errors << msg
          end
        end
      end
      errors
    end

    def search_for_options(key, options)
      return nil unless key && options && options.kind_of?(Hash)
      return options[key.to_sym] if options.key?(key.to_sym)
      result = nil
      options.each_pair do |k,v|
        result = self.search_for_options(key, v)
        break unless result.blank?
      end
      return result
    end

    module ClassMethods

      def presentables
        @presentables ||= {}
      end

      def presentable(name, model)
        presentables[name.to_sym] = model
        attr_accessor name.to_sym
        attr_accessor "#{name}_model_options".to_sym
        attr_accessor "#{name}_where_options".to_sym
      end

    end # ClassMethods

  end # PresentableBehavior

  class Presenter
    include PresentableBehavior

  end

end

#def method_missing(sym, *args)
#  receiver, *method_name = sym.to_s.split("_")
#  super unless self.respond_to? receiver.to_sym
#  self.send(receiver.to_sym).send(method_name.join("_").to_sym, *args)
#end

