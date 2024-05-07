# frozen_string_literal: true

Rails.application.routes.draw do
  resources :merchandises, only: %i[index show]

  namespace :admin do
    resources :managements, only: %i[new create edit update index destroy]
  end

  resources :tasks
  root 'merchandises#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
