module ModelBehaviors

  module RolesBehavior
    
    unless defined?(ROLES)
      ROLES = %w{ admin manager employee applicant }
    end
    if self.kind_of?(ActiveRecord::Base)
      class_eval do
        validates :role, :in => ROLES
      end
    else
      def valid?
        ROLES.include?(self.role)
      end
    end

    def role?(role_name)
      self.role == role_name
    end

    ROLES.each do |role_name|
      define_method "#{role_name}?" do
        self.role?(role_name)
      end
    end

  end

end

