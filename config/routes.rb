Storeresetter::Application.routes.draw do
  resources :people

  devise_for :users

  root :to => "welcome#index"
end
