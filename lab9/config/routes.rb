# frozen_string_literal: true

Rails.application.routes.draw do
  # root 'newton#new'
  get '/square.json', to: 'newton#show'
  get '/' => 'newton#new'
  # post '/' => 'newton#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
