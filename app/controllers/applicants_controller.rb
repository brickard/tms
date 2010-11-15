class ApplicantsController < ApplicationController
  before_filter :authenticate_user!, :only => [ :index  ]

  def index
    @applicants = Person.applicants
  end

  def new
    @applicant = ApplicantPresenter.new(:person => { :form_step => 1})
    set_progress_value
    set_step_status
  end

  def create
    @applicant = ApplicantPresenter.new(params[:applicant])
    set_progress_value
    set_step_status
    unless @applicant.save
      return render :new
    end
    unless (3..4).include?(@applicant.person.form_step)
      @applicant.person.increment!(:form_step)
    end
    set_progress_value
    set_step_status
  end

  def increment_step
    @person = Person.find(params[:id])
    return redirect_to edit_applicant_path(@person) unless @person.form_step > 2
    return redirect_to edit_applicant_path(@person) unless @person.form_step < 5
    case @person.form_step
    when 3
      return redirect_to edit_applicant_path(@person) unless 
        @person.employee.employers.count >= 2
    when 4
      return redirect_to edit_applicant_path(@person) unless 
        @person.employee.references.count >= 3
    end
    @person.increment!(:form_step) 
    redirect_to edit_applicant_path(@person)
  end

  def edit
    @person = Person.find(params[:id])
    @applicant = ApplicantPresenter.new(:person => { :id => params[:id]})
    set_progress_value
    set_step_status
  end

  alias_method :update, :create

  def destroy
    super
  end

  private

  def criteria_create
    @step = 2
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    @employee = Employee.new(params[:employee].merge!(:person_id => @person.id))
    skill_ids = params[:employee].delete(:skill_ids)
    unless skill_ids.count >= 3
      @employee.errors[:base] << "You need to select at least 3 skills!"
      return render :criteria
    end
    skill_ids.each do |skill_id|
      @employee.skills << Skill.find(skill_id) unless skill_id.blank?
    end
    unless @employee.save
      return render :criteria
    end
    return redirect_to applicant_employers_path(@person)
  end

  def employers
    @step = 3
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    @employers_left = 2 - @person.employee.employers.count
    @employer = @person.employee.employers.build
  end

  def employers_create
    @step = 3
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    @employers_left = 2 - @person.employee.employers.count
    @employer = @person.employee.employers.build(params[:employer])
    unless @employer.save
      return render :employers
    end
    return redirect_to applicant_employers_path(@person)
  end

  def references
    @step = 4
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    unless @person.employee.employers.count >= 2
      redirect_to applicant_employers_path(@person)
    end
    @references_left = 3 - @person.employee.references.count
    @reference = @person.employee.references.build
  end

  def references_create
    @step = 4
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    @reference = @person.employee.references.build(params[:reference])
    unless @reference.save
      @references_left = 3 - @person.employee.references.count
      return render :references
    end
    @person.reload
    @references_left = 3 - @person.employee.references.count
    return redirect_to applicant_references_path(@person)
  end

  def uniform_order
    @step = 5
    @progress_value = get_progress_value(@step)
    Rails.logger.warn("progress_value: #{@progress_value}")
    @person = Person.find(params[:applicant_id])
    unless @person.employee.references.count >= 3
      redirect_to applicant_references_path(@person)
    end
    @uniform_order = UniformOrder.new(:employee => @person.employee)
  end

  def uniform_order_create
    @step = 5
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    @uniform_order = UniformOrder.new(params['uniform_order'].merge(
                                      :employee => @person.employee))
    unless @uniform_order.save
      return render :uniform_order
    end
    return redirect_to applicant_agreement_path(@person), :notice => 'Uniform Order Saved!'
  end

  def agreement
    @step = 6
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
  end

  def agreement_create
    @step = 6
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    unless @person.update_attributes(params[:person])
      return render :agreement
    end
    @step = 7
    @progress_value = get_progress_value(@step)
    flash[:notice] = 'Your application has been submitted!'
    return render :complete
  end

  def set_step_status
    default_status = {
      :heading => 'Employment Application',
      :message => 'Please complete all required form fields to continue to the next step.'
    }
    step_statuses = [
      { :heading => 'Employment Application', 
        :message => 'Please complete the form to tell us about yourself.' },
      { :heading => 'Employment Criteria', 
        :message => 'Please complete the form to tell us about your qualifications.' },
      { :heading => 'Employment History', 
        :message => 'Please complete the form to tell us about your past jobs.' },
      { :heading => 'Employment References', 
        :message => 'Please complete the form to tell us about your references.' },
      { :heading => 'Employment Uniform Order', 
        :message => 'Please complete the form to tell us about your uniform preferences.' },
      { :heading => 'Employment Application Agreement', 
        :message => 'Please complete agree to the terms and enter todays date.' },
      { :heading => 'Employment Application Complete', 
        :message => 'All steps complete! Your application has been submitted.' },
    ]
    @step_status = step_statuses[@applicant.person.form_step.to_i - 1] || default_status
  end

  def total_steps
    @total_steps = 7
  end

  def set_progress_value
    @progress_value = ( ( @applicant.person.form_step.to_f / total_steps ) * 100 ).round
  end

end
