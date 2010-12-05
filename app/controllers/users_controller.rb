class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [ :new, :create ]
  before_filter :setup_scope, :setup_search

  def index
    @users = @search.all.uniq

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = @search.relation.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = @search.relation.build(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path(:scope => @scope),
          :notice => "#{@scope_title.singularize} was successfully created.") }
        format.xml  { render :xml => @user, :status => :created, 
          :location => user_path(@user, :scope => @scope) }
      else
        format.html { render :action => "new", :scope => @scope }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path(:scope => @scope), :notice =>  "#{@user.full_name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_path(:scope => @scope), 
        :notice => "#{@scope_title.singularize} was destroyed.") }
      format.xml  { head :ok }
    end
  end

  private

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

  def setup_search
    search_params = reject_blank_search_params(params.delete(:search))
    @searching = !search_params.blank?
    @search = @scope.nil? ? User.search(search_params) : User.send(@scope).search(search_params)
  end

end
