class UniformOrdersController < ApplicationController
  before_filter :authenticate_user!
  # GET /uniform_orders
  # GET /uniform_orders.xml
  def index
    @uniform_orders = UniformOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uniform_orders }
    end
  end

  # GET /uniform_orders/1
  # GET /uniform_orders/1.xml
  def show
    @uniform_order = UniformOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uniform_order }
    end
  end

  # GET /uniform_orders/new
  # GET /uniform_orders/new.xml
  def new
    @uniform_order = UniformOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uniform_order }
    end
  end

  # GET /uniform_orders/1/edit
  def edit
    @uniform_order = UniformOrder.find(params[:id])
  end

  # POST /uniform_orders
  # POST /uniform_orders.xml
  def create
    @uniform_order = UniformOrder.new(params[:uniform_order])

    respond_to do |format|
      if @uniform_order.save
        format.html { redirect_to(@uniform_order, :notice => 'Uniform order was successfully created.') }
        format.xml  { render :xml => @uniform_order, :status => :created, :location => @uniform_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uniform_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uniform_orders/1
  # PUT /uniform_orders/1.xml
  def update
    @uniform_order = UniformOrder.find(params[:id])

    respond_to do |format|
      if @uniform_order.update_attributes(params[:uniform_order])
        format.html { redirect_to(@uniform_order, :notice => 'Uniform order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uniform_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uniform_orders/1
  # DELETE /uniform_orders/1.xml
  def destroy
    @uniform_order = UniformOrder.find(params[:id])
    @uniform_order.destroy

    respond_to do |format|
      format.html { redirect_to(uniform_orders_url) }
      format.xml  { head :ok }
    end
  end
end
