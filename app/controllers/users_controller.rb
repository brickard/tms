class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [ :new, :create, :edit, :update ]
  before_filter :authenticate_user_with_scope!, :only => [ :new, :create, :edit, :update ]
  before_filter :setup_scope, :setup_search

  def hire
    @user = User.find(params[ :applicant_id ])
    @user.hire!
    redirect_to(employees_path, :notice => "#{@user.full_name} has been hired!")
  end

  def print
    %w{ applicant_id employee_id admin_id manager_id id }.each do |p|
      param = params.delete(p)
      next unless param
      @user = User.find(param)
      break unless @user.blank?
    end
    render :show, :format => :pdf
  end

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
    @user.increment_form_step if @user.applicant?
    setup_progress

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.applicant?
      @user.increment_form_step unless params[:save]
      setup_progress
    end
  end

  def create
    @user = @search.relation.build(params[:user])
    setup_progress if @user.applicant?

    respond_to do |format|
      if @user.save
        Rails.logger.debug("FORM STEP: #{@user.form_step}")
        format.html { 
          unless @scope == 'applicants'
            return redirect_to(users_path(:scope => @scope),
             :notice => "#{@scope_title.singularize} was successfully created.")
          end
          redirect_to(edit_user_path(@user, :scope => @scope))
        }
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
    @save = params.delete(:save)
    setup_progress if @user.applicant?

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { 
          unless @scope == 'applicants'
            return redirect_to(users_path(:scope => @scope),
             :notice => "#{@scope_title.singularize} was successfully updated.")
          end
          redirect_to(edit_user_path(:scope => @scope, :save => @save))
        }
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

  def set_step_status
    default_status = {
      :heading => 'Employment Application',
      :message => 'Please complete all required form fields to continue to the next step.'
    }
    step_statuses = [
      { :heading => 'Employment Application', 
        :message => 'Please complete the form to tell us about yourself.' },
      { :heading => 'Employment Criteria', 
        :message => 'Please complete the form to tell us about your qualifications.' },
      { :heading => 'Employment History', 
        :message => 'Please complete the form to tell us about your past jobs.' },
      { :heading => 'Employment References', 
        :message => 'Please complete the form to tell us about your references.' },
      { :heading => 'Employment Application Agreement', 
        :message => 'Please complete agree to the terms and enter todays date.' },
      { :heading => 'Employment Application Complete', 
        :message => 'All steps complete! Your application has been submitted.' },
    ]
    @step_status = step_statuses[@user.form_step_to_i - 1] || default_status
  end

  def total_steps
    @total_steps = 6
  end

  def set_progress_value
    @progress_value = ( ( @user.form_step_to_i.to_f / total_steps ) * 100 ).round
  end

  def setup_progress
    set_progress_value
    set_step_status
  end

  def authenticate_user_with_scope!
    return authenticate_user! unless params[:scope] == 'applicants'
  end

end
