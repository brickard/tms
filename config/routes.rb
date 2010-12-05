Storeresetter::Application.routes.draw do
  resources :skills

  resources :shifts

  resources :projects

  resources :stores

  resources :regions

  resources :clients

  resources :users

  devise_for :users, :path => 'accounts'

  root :to => 'users#index'
end
