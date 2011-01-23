Storeresetter::Application.routes.draw do
  resources :skills

  match '/shifts/print.pdf', :controller => :shifts, :action => :print, 
    :format => :pdf, :as => :shifts_print
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

  resources :users do
    get 'hire'
    get 'print'
    resources :employers
    resources :references
  end

  resources :admins,     :controller => :users, :scope => 'admins'
  resources :managers,   :controller => :users, :scope => 'managers'
  resources :applicants, :controller => :users, :scope => 'applicants'
  resources :employees,  :controller => :users, :scope => 'employees' do
    resources :evaluations
    resources :disciplines
    resources :payrolls
    resources :expenses
    resources :vacations
    resources :uniforms
  end

  devise_for :users, :path => 'accounts'

  root :to => redirect( '/users?scope=applicants' )
end
