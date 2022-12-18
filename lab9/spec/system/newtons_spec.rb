require 'rails_helper'

RSpec.describe 'Newtons', type: :system do
  before do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end

  describe '#default_usage' do
    it 'regular answer' do
      visit '/'
      fill_in 'square', with: '256'
      click_on 'Submit'
      sleep(1.0)
      assert_selector '#answer', text: 'Answer: '
    end

    it 'regular steps' do
      visit '/'
      fill_in 'square', with: '256'
      click_on 'Submit'
      sleep(1.0)
      assert_selector 'li', text: '1'
    end

    it 'negative value' do
      visit '/'
      fill_in 'square', with: '-2'
      click_on 'Submit'
      sleep(1.0)
      assert_selector '#error', text: "Error: Must be greather than zero"
    end

    it 'not a float value' do
      visit '/'
      fill_in 'square', with: 'F'
      click_on 'Submit'
      sleep(1.0)
      assert_selector '#error', text: "Error: Must be correct float"
    end
  end

  # pending "add some scenarios (or delete) #{__FILE__}"
end
