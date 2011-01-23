class EvaluationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_employee

  def index
  end

  def new
    @evaluation = @employee.evaluations.build
  end

  def create
    @evaluation = @employee.evaluations.build(params[:evaluation])
    @evaluation.manager = current_user
    unless @evaluation.save
      render :new
    else
      redirect_to(employee_evaluations_path(@employee), :notice => 'Evaluation was successfully added.')
    end
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    unless @evaluation.update_attributes(params[:evaluation])
      render :edit
    else
      redirect_to(employee_evaluations_path(@employee), :notice => 'Evaluation was successfully updated.')
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])
    unless @evaluation.destroy
      redirect_to(employee_evaluations_path(@employee), :alert => 'Evaluation deletion failed!')
    else
      redirect_to(employee_evaluations_path(@employee), :alert => 'Evaluation was successfully deleted.')
    end
  end

  private

    def load_employee
      @employee = User.find(params[:employee_id])
      raise ArgumentError.new("Employee with ID <#{params[:employee_id]}>") if @employee.nil?
    end

end
