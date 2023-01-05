require 'rails_helper'
require 'capybara'

RSpec.describe 'Users', type: :system do
  # frozen_string_literal: true

  before do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end

  describe 'user' do
    it 'create' do
      expect do
        visit '/users/new'
        fill_in 'user[login]', with: 'login'
        fill_in 'user[password]', with: 'password'
        click_on 'Create User'
      end.to change(User, :count)
    end

    it 'update' do
      visit '/users/new'
      fill_in 'user[login]', with: 'login'
      fill_in 'user[password]', with: 'password'
      click_on 'Create User'
      expect do
        visit "/users/#{User.find_by(login: 'login').id}/edit"
        fill_in 'user_login', with: 'login', fill_options: { clear: :backspace }
        fill_in 'user_password', with: 'password256'
        click_on 'Update User'
      end.to change { User.find_by(login: 'login').password }
    end

    it 'list login' do
      visit '/users/new'
      fill_in 'user[login]', with: 'login'
      fill_in 'user[password]', with: 'password'
      click_on 'Create User'
      visit '/users'
      expect(page).to match have_content('login')
    end

    it 'list password' do
      visit '/users/new'
      fill_in 'user[login]', with: 'login'
      fill_in 'user[password]', with: 'password'
      click_on 'Create User'
      visit '/users'
      expect(page).to match have_content('********')
    end
  end

  # http://localhost:3000/users/10/edit

  # pending "add some scenarios (or delete) #{__FILE__}"
end
