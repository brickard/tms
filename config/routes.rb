Storeresetter::Application.routes.draw do
  resources :shifts

  resources :projects

  resources :stores

  resources :regions

  resources :clients

  resources :roles

  resources :people

  resources :users

  devise_for :users, :path => 'accounts'

  root :to => 'clients#index'
end
