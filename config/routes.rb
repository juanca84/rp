Runpa::Application.routes.draw do
  ActiveAdmin.routes(self)

  get "home/index"

  devise_for :users

  resources :registers do 
    resources :register_steps, only: [:show, :update]
    member do
      get :get_communities
      get :get_provinces
      get :versions
    end 
  end
  
  resources :reports, only: [:index]

  root :to => 'home#index'

  #rutas para la api
  namespace :api do
    namespace :v1 do
      get 'users/get_token'
      get 'users/new_token' 
      resources :registers, only: [:index, :show]
    end
  end
end