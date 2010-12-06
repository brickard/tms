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
  resources :employees,  :controller => :users, :scope => 'employees' do
    get 'print'
  end
  resources :applicants, :controller => :users, :scope => 'applicants' do
    get 'hire'
    get 'print'
  end

  devise_for :users, :path => 'accounts'

  root :controller => :users, :action => :index, :scope => 'applicants'
end
