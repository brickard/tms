require 'spec_helper'

describe UniformOrdersController do

  def mock_uniform_order(stubs={})
    (@mock_uniform_order ||= mock_model(UniformOrder).as_null_object).tap do |uniform_order|
      uniform_order.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all uniform_orders as @uniform_orders" do
      UniformOrder.stub(:all) { [mock_uniform_order] }
      get :index
      assigns(:uniform_orders).should eq([mock_uniform_order])
    end
  end

  describe "GET show" do
    it "assigns the requested uniform_order as @uniform_order" do
      UniformOrder.stub(:find).with("37") { mock_uniform_order }
      get :show, :id => "37"
      assigns(:uniform_order).should be(mock_uniform_order)
    end
  end

  describe "GET new" do
    it "assigns a new uniform_order as @uniform_order" do
      UniformOrder.stub(:new) { mock_uniform_order }
      get :new
      assigns(:uniform_order).should be(mock_uniform_order)
    end
  end

  describe "GET edit" do
    it "assigns the requested uniform_order as @uniform_order" do
      UniformOrder.stub(:find).with("37") { mock_uniform_order }
      get :edit, :id => "37"
      assigns(:uniform_order).should be(mock_uniform_order)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created uniform_order as @uniform_order" do
        UniformOrder.stub(:new).with({'these' => 'params'}) { mock_uniform_order(:save => true) }
        post :create, :uniform_order => {'these' => 'params'}
        assigns(:uniform_order).should be(mock_uniform_order)
      end

      it "redirects to the created uniform_order" do
        UniformOrder.stub(:new) { mock_uniform_order(:save => true) }
        post :create, :uniform_order => {}
        response.should redirect_to(uniform_order_url(mock_uniform_order))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved uniform_order as @uniform_order" do
        UniformOrder.stub(:new).with({'these' => 'params'}) { mock_uniform_order(:save => false) }
        post :create, :uniform_order => {'these' => 'params'}
        assigns(:uniform_order).should be(mock_uniform_order)
      end

      it "re-renders the 'new' template" do
        UniformOrder.stub(:new) { mock_uniform_order(:save => false) }
        post :create, :uniform_order => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested uniform_order" do
        UniformOrder.should_receive(:find).with("37") { mock_uniform_order }
        mock_uniform_order.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :uniform_order => {'these' => 'params'}
      end

      it "assigns the requested uniform_order as @uniform_order" do
        UniformOrder.stub(:find) { mock_uniform_order(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:uniform_order).should be(mock_uniform_order)
      end

      it "redirects to the uniform_order" do
        UniformOrder.stub(:find) { mock_uniform_order(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(uniform_order_url(mock_uniform_order))
      end
    end

    describe "with invalid params" do
      it "assigns the uniform_order as @uniform_order" do
        UniformOrder.stub(:find) { mock_uniform_order(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:uniform_order).should be(mock_uniform_order)
      end

      it "re-renders the 'edit' template" do
        UniformOrder.stub(:find) { mock_uniform_order(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested uniform_order" do
      UniformOrder.should_receive(:find).with("37") { mock_uniform_order }
      mock_uniform_order.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the uniform_orders list" do
      UniformOrder.stub(:find) { mock_uniform_order }
      delete :destroy, :id => "1"
      response.should redirect_to(uniform_orders_url)
    end
  end

end
