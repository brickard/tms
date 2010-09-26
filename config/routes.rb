Storeresetter::Application.routes.draw do
  resources :regions

  resources :clients

  resources :roles

  resources :people
  devise_for :users
  root :to => 'clients#index'
end
