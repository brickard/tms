class ExpensesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_employee

  def index
  end

  def new
    @expense = @employee.expenses.build
  end

  def create
    @expense = @employee.expenses.build(params[:expense])
    unless @expense.save
      render :new
    else
      redirect_to(employee_expenses_path(@employee), :notice => 'Expense was successfully added.')
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    unless @expense.update_attributes(params[:expense])
      render :edit
    else
      Rails.logger.debug("PATH: #{employee_expenses_path(@employee)}")
      redirect_to(employee_expenses_path(@employee), :notice => 'Expense was successfully updated.')
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    unless @expense.destroy
      redirect_to(employee_expenses_path(@employee), :alert => 'Expense deletion failed!')
    else
      redirect_to(employee_expenses_path(@employee), :alert => 'Expense was successfully deleted.')
    end
  end

  private

    def load_employee
      @employee = User.find(params[:employee_id])
      raise ArgumentError.new("Employee with ID <#{params[:employee_id]}>") if @employee.nil?
    end

end
