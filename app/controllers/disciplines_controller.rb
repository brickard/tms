class DisciplinesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_employee

  def index
  end

  def new
    @discipline = @employee.disciplines.build
  end

  def create
    @discipline = @employee.disciplines.build(params[:discipline])
    unless @discipline.save
      render :new
    else
      redirect_to(employee_disciplines_path(@employee), :notice => 'Discipline was successfully added.')
    end
  end

  def edit
    @discipline = Discipline.find(params[:id])
  end

  def update
    @discipline = Discipline.find(params[:id])
    unless @discipline.update_attributes(params[:discipline])
      render :edit
    else
      redirect_to(employee_disciplines_path(@employee), :notice => 'Discipline was successfully updated.')
    end
  end

  def destroy
    @discipline = Discipline.find(params[:id])
    unless @discipline.destroy
      redirect_to(employee_disciplines_path(@employee), :alert => 'Discipline deletion failed!')
    else
      redirect_to(employee_disciplines_path(@employee), :alert => 'Discipline was successfully deleted.')
    end
  end

  private

    def load_employee
      @employee = User.find(params[:employee_id])
      raise ArgumentError.new("Employee with ID <#{params[:employee_id]}>") if @employee.nil?
    end

end
