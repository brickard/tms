class UniformsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_employee

  def index
  end

  def new
    @uniform = @employee.uniforms.build
  end

  def create
    @uniform = @employee.uniforms.build(params[:uniform])
    unless @uniform.save
      render :new
    else
      redirect_to(employee_uniforms_path(@employee), :notice => 'Uniform was successfully added.')
    end
  end

  def edit
    @uniform = Uniform.find(params[:id])
  end

  def update
    @uniform = Uniform.find(params[:id])
    unless @uniform.update_attributes(params[:uniform])
      render :edit
    else
      redirect_to(employee_uniforms_path(@employee), :notice => 'Uniform was successfully updated.')
    end
  end

  def destroy
    @uniform = Uniform.find(params[:id])
    unless @uniform.destroy
      redirect_to(employee_uniforms_path(@employee), :alert => 'Uniform deletion failed!')
    else
      redirect_to(employee_uniforms_path(@employee), :alert => 'Uniform was successfully deleted.')
    end
  end

  private

    def load_employee
      @employee = User.find(params[:employee_id])
      raise ArgumentError.new("Employee with ID <#{params[:employee_id]}>") if @employee.nil?
    end

end
