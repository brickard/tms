class AccidentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_employee

  def index
  end

  def new
    @accident = @employee.accidents.build
  end

  def create
    @accident = @employee.accidents.build(params[:accident])
    unless @accident.save
      render :new
    else
      redirect_to(employee_accidents_path(@employee), :notice => 'Accident was successfully added.')
    end
  end

  def edit
    @accident = Accident.find(params[:id])
  end

  def update
    @accident = Accident.find(params[:id])
    unless @accident.update_attributes(params[:accident])
      render :edit
    else
      redirect_to(employee_accidents_path(@employee), :notice => 'Accident was successfully updated.')
    end
  end

  def destroy
    @accident = Accident.find(params[:id])
    unless @accident.destroy
      redirect_to(employee_accidents_path(@employee), :alert => 'Accident deletion failed!')
    else
      redirect_to(employee_accidents_path(@employee), :alert => 'Accident was successfully deleted.')
    end
  end

  private

    def load_employee
      @employee = User.find(params[:employee_id])
      raise ArgumentError.new("Employee with ID <#{params[:employee_id]}>") if @employee.nil?
    end

end
