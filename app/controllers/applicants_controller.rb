class ApplicantsController < ApplicationController
  before_filter :authenticate_user!, :only => [ :index  ]

  def index
    skills = params.delete(:skills) rescue nil
    @search = skills.blank? ? 
      Person.applicants.search(params[:search]) : 
      Person.applicants.with_skills(skills).search(params[:search])
    @applicants = @search.all.uniq
  end

  def new
    @applicant = ApplicantPresenter.new(:person => { :form_step => 1})
    set_progress_value
    set_step_status
  end

  def hire
    @applicant = Person.find(params[:applicant_id])
    @applicant.hired_at = DateTime.now
    @applicant.save!
    redirect_to(applicants_path, :notice => "You have hired #{@applicant.full_name}")
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
