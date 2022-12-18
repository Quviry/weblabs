# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Newtons' do
  describe 'GET /index' do
    it 'right controller' do
      get new_path
      expect(controller.action_name).to eq 'new'
      assert_response :success
    end

    it 'right content' do
      get new_path
      expect(response.body).to match('Submit')
      assert_response :success
    end
  end

  describe 'GET /show' do
    let(:root_sixteen) { '4.000000636692939' }
    let(:get_show) { ->(side, argument) { get show_path('any'), params: { side: side, square: argument } } }
    let(:xml_resp_regex) do
      %r{<\?xml .*\?>[.\s]<hash>[.\s]*<steps .*>[.\s]*?<value .*>[.\s]*?<errors .*>[.\s]*</hash>}m
    end

    def after
      assert_response :success # only positive tests expected
    end

    it 'server' do
      get_show['server', 16]
      expect(response.body).to match root_sixteen
    end

    it 'server type' do
      get_show['server', 16]
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'client' do
      get_show['client', 16]
      expect(response.body).to match root_sixteen
    end

    it 'client type' do
      get_show['client', 16]
      expect(response.content_type).to eq 'application/xhtml+xml; charset=utf-8'
    end

    it 'client type content' do
      get_show['client', 16]
      expect(response.body).to match xml_resp_regex
    end

    it 'xml text' do
      get_show['raw text', 16]
      expect(response.body).to match root_sixteen
    end

    it 'xml text type' do
      get_show['raw text', 16]
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end

    it 'xml application' do
      get_show['raw xml', 16]
      expect(response.body).to match root_sixteen
    end

    it 'xml application type' do
      get_show['raw xml', 16]
      expect(response.content_type).to eq 'application/xhtml+xml; charset=utf-8'
    end

    it 'xml application type content' do
      get_show['raw xml', 16]
      expect(response.body).to match xml_resp_regex
    end
  end
  # pending "add some examples (or delete) #{__FILE__}"
end
