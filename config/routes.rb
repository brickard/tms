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

  resources :people

  resources :users

  resources :applicants do
    get 'hire'
    member do
      post :increment_step
    end
  end

  devise_for :users, :path => 'accounts'

  root :to => 'clients#index'
end
