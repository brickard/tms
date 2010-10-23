Storeresetter::Application.routes.draw do
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

  get 'applicants/index', :as => :applicants
  get 'applicants/new', :as => :new_applicant
  post 'applicants/create', :as => :create_applicant
  match 'applicants/criteria/:person_id', :as => :new_applicant_criteria,
    :via => [ :get ], :controller => :applicants, :action => :criteria
  match 'applicants/criteria_create/:person_id', :as => :create_applicant_criteria,
    :via => [ :post ], :controller => :applicants, :action => :criteria_create
  match 'applicants/employers/:person_id', :as => :new_applicant_employers,
    :via => [ :get ], :controller => :applicants, :action => :employers
  match 'applicants/employers_create/:person_id', :as => :create_applicant_employers,
    :via => [ :post ], :controller => :applicants, :action => :employers_create
  match 'applicants/references/:person_id', :as => :new_applicant_references,
    :via => [ :get ], :controller => :applicants, :action => :references
  match 'applicants/references_create/:person_id', :as => :create_applicant_references,
    :via => [ :post ], :controller => :applicants, :action => :references_create
  match 'applicants/uniform_order/:person_id', :as => :new_applicant_uniform_order,
    :via => [ :get ], :controller => :applicants, :action => :uniform_order
  match 'applicants/uniform_order_create/:person_id', :as => :create_applicant_uniform_order,
    :via => [ :post ], :controller => :applicants, :action => :uniform_order_create
  match 'applicants/agreement/:person_id', :as => :new_applicant_agreement,
    :via => [ :get ], :controller => :applicants, :action => :agreement
  match 'applicants/agreement_create/:person_id', :as => :create_applicant_agreement,
    :via => [ :post ], :controller => :applicants, :action => :agreement_create
  match 'applicants/complete/:person_id', :as => :new_applicant_complete,
    :via => [ :get ], :controller => :applicants, :action => :complete

  devise_for :users, :path => 'accounts'

  root :to => 'clients#index'
end
