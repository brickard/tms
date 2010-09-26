require 'spec_helper'

describe ShiftsController do

  def mock_shift(stubs={})
    @mock_shift ||= mock_model(Shift, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all shifts as @shifts" do
      Shift.stub(:all) { [mock_shift] }
      get :index
      assigns(:shifts).should eq([mock_shift])
    end
  end

  describe "GET show" do
    it "assigns the requested shift as @shift" do
      Shift.stub(:find).with("37") { mock_shift }
      get :show, :id => "37"
      assigns(:shift).should be(mock_shift)
    end
  end

  describe "GET new" do
    it "assigns a new shift as @shift" do
      Shift.stub(:new) { mock_shift }
      get :new
      assigns(:shift).should be(mock_shift)
    end
  end

  describe "GET edit" do
    it "assigns the requested shift as @shift" do
      Shift.stub(:find).with("37") { mock_shift }
      get :edit, :id => "37"
      assigns(:shift).should be(mock_shift)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created shift as @shift" do
        Shift.stub(:new).with({'these' => 'params'}) { mock_shift(:save => true) }
        post :create, :shift => {'these' => 'params'}
        assigns(:shift).should be(mock_shift)
      end

      it "redirects to the created shift" do
        Shift.stub(:new) { mock_shift(:save => true) }
        post :create, :shift => {}
        response.should redirect_to(shift_url(mock_shift))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shift as @shift" do
        Shift.stub(:new).with({'these' => 'params'}) { mock_shift(:save => false) }
        post :create, :shift => {'these' => 'params'}
        assigns(:shift).should be(mock_shift)
      end

      it "re-renders the 'new' template" do
        Shift.stub(:new) { mock_shift(:save => false) }
        post :create, :shift => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested shift" do
        Shift.should_receive(:find).with("37") { mock_shift }
        mock_shift.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :shift => {'these' => 'params'}
      end

      it "assigns the requested shift as @shift" do
        Shift.stub(:find) { mock_shift(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:shift).should be(mock_shift)
      end

      it "redirects to the shift" do
        Shift.stub(:find) { mock_shift(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(shift_url(mock_shift))
      end
    end

    describe "with invalid params" do
      it "assigns the shift as @shift" do
        Shift.stub(:find) { mock_shift(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:shift).should be(mock_shift)
      end

      it "re-renders the 'edit' template" do
        Shift.stub(:find) { mock_shift(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested shift" do
      Shift.should_receive(:find).with("37") { mock_shift }
      mock_shift.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the shifts list" do
      Shift.stub(:find) { mock_shift }
      delete :destroy, :id => "1"
      response.should redirect_to(shifts_url)
    end
  end

end
