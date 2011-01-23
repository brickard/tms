class VacationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_employee

  def index
  end

  def new
    @vacation = @employee.vacations.build
  end

  def create
    @vacation = @employee.vacations.build(params[:vacation])
    unless @vacation.save
      render :new
    else
      redirect_to(employee_vacations_path(@employee), :notice => 'Vacation was successfully added.')
    end
  end

  def edit
    @vacation = Vacation.find(params[:id])
  end

  def update
    @vacation = Vacation.find(params[:id])
    unless @vacation.update_attributes(params[:vacation])
      render :edit
    else
      redirect_to(employee_vacations_path(@employee), :notice => 'Vacation was successfully updated.')
    end
  end

  def destroy
    @vacation = Vacation.find(params[:id])
    unless @vacation.destroy
      redirect_to(employee_vacations_path(@employee), :alert => 'Vacation deletion failed!')
    else
      redirect_to(employee_vacations_path(@employee), :alert => 'Vacation was successfully deleted.')
    end
  end

  private

    def load_employee
      @employee = User.find(params[:employee_id])
      raise ArgumentError.new("Employee with ID <#{params[:employee_id]}>") if @employee.nil?
    end

end
