require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  before do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
    User.destroy_all
  end

  describe 'path' do
    it 'register' do
      visit '/users/new'
      fill_in 'user[login]', with: 'login'
      fill_in 'user[password]', with: 'password'
      click_on 'Create User'

      visit login_path
      fill_in 'user[login]', with: 'login'
      fill_in 'user[password]', with: 'password'
      click_on 'Login'
      expect(page).to have_content('Newton-Raphson square root calculator')
    end

    it 'register and calculate' do
      visit '/users/new'
      fill_in 'user[login]', with: 'login'
      fill_in 'user[password]', with: 'password'
      click_on 'Create User'

      visit login_path
      fill_in 'user[login]', with: 'login'
      fill_in 'user[password]', with: 'password'
      click_on 'Login'

      expect(page).to have_text 'Newton'
      fill_in 'square', with: '16', fill_options: { clear: :backspace }
      click_on 'Submit'
      expect(page).to have_content('4.000000636692939')
    end
  end

  describe 'no path' do
    it 'Not authed' do
      expect do
        visit '/square'
        expect(page).to have_text 'test'
      end.to raise_error(ActionController::RoutingError)
    end
  end
end
