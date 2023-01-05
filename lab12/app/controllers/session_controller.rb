require 'digest'

class SessionController < ApplicationController
  def destroy
    session[:current_user_id] = ''
    redirect_to login_path
  end

  def new
    @user = User.new
    render 'login' and return unless authorised?

    redirect_to root_path
  end

  def create
    return unless (user = User.authenticate(params[:user][:login], params[:user][:password]))

    # Сохраняем идентификатор пользователя ID в сессию
    # для последующего использования
    session[:current_user_id] = user.id
    redirect_to root_url

    # redirect_to login_path, error: setup_userdata(params['user']) ? 'Incorrect login or password' : ''
  end

  private

  def setup_userdata(data)
    user = User.find_by(login: data[:login])
    flash[:error] = 'User not found' and return unless user
    flash[:error] = 'Wrong login or password' and return unless user.password == helpers.hashpass(data[:password])

    setup_token(user)
  end

  def setup_token(user)
    hash = helpers.hashpass "#{user.login}:#{user.password}"
    session[:user_token] = "#{user.id}:#{hash}"
  end

  def authorised?
    !session[:current_user_id].to_s.empty?
  end
end
