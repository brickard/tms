class ApplicantsController < ApplicationController
  before_filter :authenticate_user!, :only => [ :index  ]
  def index
    @applicants = Person.applicants
  end

  def new
    @step = 1
    @progress_value = get_progress_value(@step)
    @person = Person.new
    @user = User.new
  end

  def create
    @step = 1
    @progress_value = get_progress_value(@step)
    user_params = params[:person].delete(:user)
    random_password = ActiveSupport::SecureRandom.hex(5)
    [ :password, :password_confirmation ].each do |meth|
      user_params[meth] = random_password
    end
    @person = Person.new(params[:person])
    unless @person.save
      return render :new
    end
    user_params[:person_id] = @person.id
    @user = User.new(user_params)
    @user.skip_confirmation!
    unless @user.save
      @person.destroy
      return render :new
    end
    return redirect_to applicant_criteria_path(@person)
  end

  def criteria
    @step = 2
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    @employee = Employee.new(:person_id => @person.id)
  end

  def criteria_create
    @step = 2
    @progress_value = get_progress_value(@step)
    @person = Person.find(params[:applicant_id])
    @employee = Employee.new(params[:employee].merge!(:person_id => @person.id))
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

  private
  def total_steps
    @total_steps = 7
  end

  def get_progress_value(current_step)
    ( ( current_step.to_f / total_steps ) * 100 ).round
  end

end
