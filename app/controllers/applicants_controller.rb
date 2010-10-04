class ApplicantsController < ApplicationController
  def index
    @applicants = Person.applicants
  end

  def new
    @person = Person.new
    @user = User.new
  end

  def criteria
    user_params = params[:person].delete(:user)
    random_password = ActiveSupport::SecureRandom.hex(5)
    [ :password, :password_confirmation ].each do |meth|
      user_params[meth] = random_password
    end
    @person = Person.new(params[:person])
    unless @person.save
      render :new
    end
    user_params[:person_id] = @person.id
    @user = User.new(user_params)
    unless @user.save
      @person.destroy
      render :new
    end
    @employee = Employee.new(:person_id => @person.id)
  end

  def reference
  end
end
