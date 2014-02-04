Runpa::Application.routes.draw do

  ActiveAdmin.routes(self)

  get "home/index"

  devise_for :users

  resources :registers
  resources :register_steps

  root :to => 'home#index'
end
