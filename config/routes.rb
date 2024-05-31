# frozen_string_literal: true

Rails.application.routes.draw do
  root 'merchandises#index'
  resources :merchandises, only: %i[index show]

  namespace :admin do
    resources :managements, only: %i[new create edit update index destroy]
  end

  # resources :carts, only: %i[index create destroy]

  get '/my_cart' => 'carts#my_cart'
  get '/create' => 'carts#create'
  delete '/destroy' => 'carts#destroy'

  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
