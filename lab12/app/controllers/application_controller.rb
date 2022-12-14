# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionController::Cookies
  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by(id: session[:current_user_id])
  end
end
