# frozen_string_literal: true

Rails.application.routes.draw do
  get '/' => 'newton#new', as: 'new'
  get '/:ur' => 'newton#show', as: 'show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
