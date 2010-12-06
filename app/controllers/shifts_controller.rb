class ShiftsController < ApplicationController
  before_filter :authenticate_user!

  def remove
    @user = User.find(params[:employee_id])
    @user.shift = nil
    if @user.save
      redirect_to(:back, :notice => "#{@user.full_name} removed from shift!")
    else
      Rails.logger.warn("ERROR REMOVING #{@user.full_name} from SHIFT:\n\n#{@user.errors.full_messages.inspect}\n\n")
      redirect_to(:back, :alert => "An error occured removing #{@user.full_name} from shift!")
    end
  end

  def add
    @user = User.find(params[:employee][:employee_id])
    @shift = Shift.find(params[:shift_id])
    @user.shift = @shift
    if @user.save
      redirect_to(:back, :notice => "#{@user.full_name} added to shift!")
    else
      Rails.logger.warn("ERROR ADDING #{@user.full_name} to SHIFT:\n\n#{@user.errors.full_messages.inspect}\n\n")
      redirect_to(:back, :alert => "An error occured adding #{@user.full_name} from shift!")
    end
  end

  # GET /shifts
  # GET /shifts.xml
  def index
    @searching = !params[:shifts_search].blank?
    @shifts_search = Shift.search(params[:shifts_search])
    @shifts = @shifts_search.all.uniq
    @employees_search = @shifts.count == 1 ?
      User.employees.on_shift(@shifts.first).search(params[:employees_search]) :
      User.employees.search(params[:employees_search])
    @employees = @employees_search.all.uniq

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shifts }
    end
  end

  # GET /shifts/1
  # GET /shifts/1.xml
  def show
    @shift = Shift.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shift }
    end
  end

  # GET /shifts/new
  # GET /shifts/new.xml
  def new
    @shift = Shift.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shift }
    end
  end

  # GET /shifts/1/edit
  def edit
    @shift = Shift.find(params[:id])
  end

  # POST /shifts
  # POST /shifts.xml
  def create
    @shift = Shift.new(params[:shift])

    respond_to do |format|
      if @shift.save
        format.html { redirect_to(@shift, :notice => 'Shift was successfully created.') }
        format.xml  { render :xml => @shift, :status => :created, :location => @shift }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shifts/1
  # PUT /shifts/1.xml
  def update
    @shift = Shift.find(params[:id])

    respond_to do |format|
      if @shift.update_attributes(params[:shift])
        format.html { redirect_to(@shift, :notice => 'Shift was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shift.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.xml
  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to(shifts_url) }
      format.xml  { head :ok }
    end
  end
end
