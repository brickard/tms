Storeresetter::Application.routes.draw do
  resources :skills

  resources :shifts do
    get 'add'
    resources :employees, :controller => :shifts do
      get 'remove'
    end
  end

  resources :projects

  resources :stores

  resources :regions

  resources :clients

  resources :users

  resources :admins,     :controller => :users, :scope => 'admins' do
    get 'print'
  end
  resources :managers,   :controller => :users, :scope => 'managers' do
    get 'print'
  end
  resources :employees,  :controller => :users, :scope => 'employees' do
    get 'print'
  end
  resources :applicants, :controller => :users, :scope => 'applicants' do
    get 'hire'
    get 'print'
  end

  devise_for :users, :path => 'accounts'

  #root :controller => :users, :action => :index, :scope => 'applicants'
  root :to => redirect( '/users?scope=applicants' )
end
