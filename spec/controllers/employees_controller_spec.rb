require 'spec_helper'

describe EmployeesController do

  def mock_employee(stubs={})
    @mock_employee ||= mock_model(Employee, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all employees as @employees" do
      Employee.stub(:all) { [mock_employee] }
      get :index
      assigns(:employees).should eq([mock_employee])
    end
  end

  describe "GET show" do
    it "assigns the requested employee as @employee" do
      Employee.stub(:find).with("37") { mock_employee }
      get :show, :id => "37"
      assigns(:employee).should be(mock_employee)
    end
  end

  describe "GET new" do
    it "assigns a new employee as @employee" do
      Employee.stub(:new) { mock_employee }
      get :new
      assigns(:employee).should be(mock_employee)
    end
  end

  describe "GET edit" do
    it "assigns the requested employee as @employee" do
      Employee.stub(:find).with("37") { mock_employee }
      get :edit, :id => "37"
      assigns(:employee).should be(mock_employee)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created employee as @employee" do
        Employee.stub(:new).with({'these' => 'params'}) { mock_employee(:save => true) }
        post :create, :employee => {'these' => 'params'}
        assigns(:employee).should be(mock_employee)
      end

      it "redirects to the created employee" do
        Employee.stub(:new) { mock_employee(:save => true) }
        post :create, :employee => {}
        response.should redirect_to(employee_url(mock_employee))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employee as @employee" do
        Employee.stub(:new).with({'these' => 'params'}) { mock_employee(:save => false) }
        post :create, :employee => {'these' => 'params'}
        assigns(:employee).should be(mock_employee)
      end

      it "re-renders the 'new' template" do
        Employee.stub(:new) { mock_employee(:save => false) }
        post :create, :employee => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested employee" do
        Employee.should_receive(:find).with("37") { mock_employee }
        mock_employee.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :employee => {'these' => 'params'}
      end

      it "assigns the requested employee as @employee" do
        Employee.stub(:find) { mock_employee(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:employee).should be(mock_employee)
      end

      it "redirects to the employee" do
        Employee.stub(:find) { mock_employee(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(employee_url(mock_employee))
      end
    end

    describe "with invalid params" do
      it "assigns the employee as @employee" do
        Employee.stub(:find) { mock_employee(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:employee).should be(mock_employee)
      end

      it "re-renders the 'edit' template" do
        Employee.stub(:find) { mock_employee(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested employee" do
      Employee.should_receive(:find).with("37") { mock_employee }
      mock_employee.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the employees list" do
      Employee.stub(:find) { mock_employee }
      delete :destroy, :id => "1"
      response.should redirect_to(employees_url)
    end
  end

end
