Storeresetter::Application.routes.draw do
  resources :people
  devise_for :users
  root :to => 'people#index'
end
