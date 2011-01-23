class IncidentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_employee

  def index
  end

  def new
    @incident = @employee.incidents.build
  end

  def create
    @incident = @employee.incidents.build(params[:incident])
    unless @incident.save
      render :new
    else
      redirect_to(employee_incidents_path(@employee), :notice => 'Incident was successfully added.')
    end
  end

  def edit
    @incident = Incident.find(params[:id])
  end

  def update
    @incident = Incident.find(params[:id])
    unless @incident.update_attributes(params[:incident])
      render :edit
    else
      redirect_to(employee_incidents_path(@employee), :notice => 'Incident was successfully updated.')
    end
  end

  def destroy
    @incident = Incident.find(params[:id])
    unless @incident.destroy
      redirect_to(employee_incidents_path(@employee), :alert => 'Incident deletion failed!')
    else
      redirect_to(employee_incidents_path(@employee), :alert => 'Incident was successfully deleted.')
    end
  end

  private

    def load_employee
      @employee = User.find(params[:employee_id])
      raise ArgumentError.new("Employee with ID <#{params[:employee_id]}>") if @employee.nil?
    end

end
