# frozen_string_literal: true

Rails.application.routes.draw do
  root 'newton#new'
  get '/index' => 'newton#index', as: 'index'
  get '/' => 'newton#new', as: 'new'
  post '/' => 'newton#create', as: 'create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
