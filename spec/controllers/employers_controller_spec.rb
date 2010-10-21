require 'spec_helper'

describe EmployersController do

  def mock_employer(stubs={})
    (@mock_employer ||= mock_model(Employer).as_null_object).tap do |employer|
      employer.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all employers as @employers" do
      Employer.stub(:all) { [mock_employer] }
      get :index
      assigns(:employers).should eq([mock_employer])
    end
  end

  describe "GET show" do
    it "assigns the requested employer as @employer" do
      Employer.stub(:find).with("37") { mock_employer }
      get :show, :id => "37"
      assigns(:employer).should be(mock_employer)
    end
  end

  describe "GET new" do
    it "assigns a new employer as @employer" do
      Employer.stub(:new) { mock_employer }
      get :new
      assigns(:employer).should be(mock_employer)
    end
  end

  describe "GET edit" do
    it "assigns the requested employer as @employer" do
      Employer.stub(:find).with("37") { mock_employer }
      get :edit, :id => "37"
      assigns(:employer).should be(mock_employer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created employer as @employer" do
        Employer.stub(:new).with({'these' => 'params'}) { mock_employer(:save => true) }
        post :create, :employer => {'these' => 'params'}
        assigns(:employer).should be(mock_employer)
      end

      it "redirects to the created employer" do
        Employer.stub(:new) { mock_employer(:save => true) }
        post :create, :employer => {}
        response.should redirect_to(employer_url(mock_employer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employer as @employer" do
        Employer.stub(:new).with({'these' => 'params'}) { mock_employer(:save => false) }
        post :create, :employer => {'these' => 'params'}
        assigns(:employer).should be(mock_employer)
      end

      it "re-renders the 'new' template" do
        Employer.stub(:new) { mock_employer(:save => false) }
        post :create, :employer => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested employer" do
        Employer.should_receive(:find).with("37") { mock_employer }
        mock_employer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :employer => {'these' => 'params'}
      end

      it "assigns the requested employer as @employer" do
        Employer.stub(:find) { mock_employer(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:employer).should be(mock_employer)
      end

      it "redirects to the employer" do
        Employer.stub(:find) { mock_employer(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(employer_url(mock_employer))
      end
    end

    describe "with invalid params" do
      it "assigns the employer as @employer" do
        Employer.stub(:find) { mock_employer(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:employer).should be(mock_employer)
      end

      it "re-renders the 'edit' template" do
        Employer.stub(:find) { mock_employer(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested employer" do
      Employer.should_receive(:find).with("37") { mock_employer }
      mock_employer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the employers list" do
      Employer.stub(:find) { mock_employer }
      delete :destroy, :id => "1"
      response.should redirect_to(employers_url)
    end
  end

end
