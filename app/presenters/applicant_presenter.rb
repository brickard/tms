class ApplicantPresenter < Presentable::Presenter
  presentable :person, Person 
  presentable :user, User 

  def initialize(options={})
    @skill_ids = options[:employee].delete(:skills) rescue nil
    @skills = []
    super
    setup_options_for_step(options)
  end

  def setup_options_for_step(options)
    case @person.form_step
    when 1
    when 2
      self.class.class_eval do
        presentable :employee, Employee
      end
      initialize_presentable(:employee, Employee, options)
      @skills << @skill_ids.map{ |skill_id| 
        Skill.find(skill_id) 
      } unless @skill_ids.blank?
    when 3
      self.class.class_eval do
        presentable :employer, Employer
      end
      initialize_presentable(:employer, Employer, options)
    when 4
      self.class.class_eval do
        presentable :reference, Reference
      end
      initialize_presentable(:reference, Reference, options)
    when 5
      self.class.class_eval do
        presentable :uniform_order, UniformOrder
      end
      initialize_presentable(:uniform_order, UniformOrder, options)
    end
  end

  def save(*args)
    run_before_save_callbacks
    results = super
    run_after_save_callbacks if results == true
    return results
  end

  def run_before_save_callbacks
    case @person.form_step
    when 1
      @user.skip_confirmation! unless @user.blank?
    when 2
    when 3
    end
  end

  def run_after_save_callbacks
    case @person.form_step
    when 1
      @person.user = @user
      @person.save!
    when 2
      @skills.each do |skill|
        @employee.skills << skill
      end
    when 3
    end
  end

end
