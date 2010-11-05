Storeresetter::Application.routes.draw do
  resources :skills

  resources :uniform_orders

  resources :references

  resources :employers

  resources :employees

  resources :shifts

  resources :projects

  resources :stores

  resources :regions

  resources :clients

  resources :roles

  resources :people

  resources :users

  resources :applicants do
    get 'criteria', :action => :criteria
    post 'criteria_create', :action => :criteria_create
    match 'employers', :action => :employers
    match 'employers_create', :action => :employers_create
    match 'references', :action => :references
    match 'references_create', :action => :references_create
    match 'uniform_order', :action => :uniform_order
    match 'uniform_order_create', :action => :uniform_order_create
    match 'agreement', :action => :agreement
    match 'agreement_create', :action => :agreement_create
  end

  devise_for :users, :path => 'accounts'

  root :to => 'clients#index'
end
