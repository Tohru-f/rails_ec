# frozen_string_literal: true

Rails.application.routes.draw do
  root 'merchandises#index'
  resources :merchandises, only: %i[index show]

  namespace :admin do
    resources :managements, only: %i[new create edit update index destroy]
    resources :orders, only: %i[index show]
  end

  get '/my_cart' => 'carts#my_cart'
  get '/create' => 'carts#create'
  delete '/destroy' => 'carts#destroy'

  resources :orders, only: %i[new create]

  get '/update' => 'orders#update'

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
