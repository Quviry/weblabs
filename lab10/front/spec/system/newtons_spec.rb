# frozen_string_literal: true

require 'rails_helper'
require 'capybara'

RSpec.describe 'Newtons' do
  before do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end

  describe 'global usage' do
    it 'server works' do
      expect { Net::HTTP.get_response(URI('http://localhost:3000')) }.not_to raise_error
    end
  end

  describe '#default_usage' do
    def get_page(value, option)
      visit new_path
      fill_in 'square', with: value
      choose option
      click_on 'Submit'
      sleep(0.1)
      page
    end
    let(:page257) { get_page 257, 'side_server' }
    let(:page256) { get_page 256, 'side_server' }

    it 'regular answer' do
      get_page 256, 'side_server'
      assert_selector '#response', text: 'Response: '
    end

    it 'regular difference in answer' do
      expect(page256.text).not_to eq page257.text
    end

    it 'get html' do
      get_page 256, 'side_server'
      expect(page.body).to match 'html'
    end

    it 'get xml to html' do
      get_page 256, 'side_client'
      expect(page.body).to have_selector 'p#response'
    end

    it 'get xml raw' do
      get_page 256, 'side_raw_text'
      expect(page.body).to have_selector 'hash step'
    end

    it 'get xml raw in text format' do
      get_page 256, 'side_raw_xml'
      expect(page.body).to match 'hash'
    end

    it 'same render' do
      source = get_page 256, 'side_client'
      expect(get_page(256, 'side_server').body).to match source.body
    end
  end

  # pending "add some scenarios (or delete) #{__FILE__}"
end
