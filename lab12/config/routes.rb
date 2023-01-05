# frozen_string_literal: true

class SessionConstraint
  def initialize; end

  # authorised?
  def matches?(request)
    !request.session[:current_user_id].to_s.empty?
  end
end

Rails.application.routes.draw do
  resources :users
  get '/newton', to: 'newton#new', constraints: SessionConstraint.new, as: 'root'
  post '/newton', to: 'newton#create', constraints: SessionConstraint.new, as: 'create'
  get '/', to: 'session#new', as: 'login'
  post '/', to: 'session#create'
  get '/logout', to: 'session#destroy', as: 'logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
