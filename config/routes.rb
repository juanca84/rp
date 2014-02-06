Runpa::Application.routes.draw do
  ActiveAdmin.routes(self)

  get "home/index"

  devise_for :users

  resources :registers do 
    resources :register_steps, only: [:show, :update]
  end
  
  resources :reports, only: [:index]

  root :to => 'home#index'
end