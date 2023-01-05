require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:user) { User.create!(login: 'login', password: 'password') }

  describe 'GET / unauthorised' do
    it 'path works' do
      get login_path
      expect(response).to have_http_status(:ok)
    end

    it 'Content from template' do
      get login_path
      expect(body).to match 'Login'
    end

    it 'Not authed' do
      expect { get root_path }.to raise_error ActionController::RoutingError
    end
  end
end
