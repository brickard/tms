Storeresetter::Application.routes.draw do
  resources :employees

  resources :shifts

  resources :projects

  resources :stores

  resources :regions

  resources :clients

  resources :roles

  resources :people

  resources :users

  get 'applicants/index', :as => :applicants
  get 'applicants/new', :as => :new_applicants
  match 'applicants/criteria', :via => [ :get, :post, :put ], :as => :new_applicants_criteria
  match 'applicants/references', :via => [ :get, :post, :put ], :as => :new_applicants_references
  #match 'applicants/', :via => [ :get, :post ], :as => :new_applicants_references

  devise_for :users, :path => 'accounts'

  root :to => 'clients#index'
end
