class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [ :new, :create ]
  before_filter :setup_scope

  def setup_scope
    @scope = params.delete(:scope)
    @scope_name = @scope || 'users'
    @scope_title = @scope_name.capitalize
  end

  def reject_blank_search_params(hash)
    return hash if hash.blank?
    hash.reject! { |k, v| v.blank? }
    hash = hash.each_pair { |k, v| reject_blank_search_params( v ) if v.kind_of?( Hash ) }
    return hash
  end

  def index
    search_params = reject_blank_search_params(params.delete(:search))
    Rails.logger.debug( "SEARCH PARAMS: #{search_params.inspect}" )
    @searching = !search_params.blank?
    @search = @scope.nil? ? User.search(search_params) : User.send(@scope).search(search_params)
    @users = @search.all.uniq

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @user.person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @user.person ||= Person.new
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.skip_confirmation!

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
