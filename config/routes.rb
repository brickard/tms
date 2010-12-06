Storeresetter::Application.routes.draw do
  resources :skills

  resources :shifts

  resources :projects

  resources :stores

  resources :regions

  resources :clients

  resources :users

  resources :admins,     :controller => :users, :scope => 'admins'
  resources :managers,   :controller => :users, :scope => 'managers'
  resources :employees,  :controller => :users, :scope => 'employees'
  resources :applicants, :controller => :users, :scope => 'applicants'

  devise_for :users, :path => 'accounts'

  root :controller => :users, :action => :index, :scope => 'applicants'
end
