class ApplicantsController < ApplicationController
  def index
    @applicants = Person.applicants
  end

  def new
    @person = Person.new
    @user = User.new
  end

  def create
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
    unless @user.save
      @person.destroy
      return render :new
    end
    return redirect_to new_applicant_criteria_path(@person)
  end

  def criteria
    @person = Person.find(params[:person_id])
    @employee = Employee.new(:person_id => @person.id)
  end

  def criteria_create
    @person = Person.find(params[:person_id])
    @employee = Employee.new(params[:employee].merge!(:person_id => @person.id))
    unless @employee.save
      return render :criteria
    end
    return redirect_to new_applicant_employers_path(@person)
  end

  def employers
    @person = Person.find(params[:person_id])
    @employer = @person.employee.employers.build
  end

  def employers_create
    @person = Person.find(params[:person_id])
    @employer = @person.employee.employers.build(params[:employer])
  end

  def references
  end

  def references_create
  end

end
