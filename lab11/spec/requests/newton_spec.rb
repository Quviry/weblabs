require 'rails_helper'

RSpec.describe 'Newtons', type: :request do
  describe 'GET /index' do
    it 'Correct controller' do
      get index_path
      expect(controller.action_name).to eq 'index'
    end
  end

  describe 'GET /' do
    it 'Correct controller' do
      get new_path
      expect(controller.action_name).to eq 'new'
    end
  end

  describe 'POST /' do
    it 'Correct controller' do
      post create_path('square'), params: { square: '10' }
      expect(controller.action_name).to eq 'create'
    end

    it 'Generates new' do
      expect { post create_path('square'), params: { square: '101' } }.to change(Newton, :count)
    end

    it 'Different results' do
      post create_path('square'), params: { square: '10' }
      temp = response
      post create_path('square'), params: { square: '11' }
      expect(response.body).not_to eq temp.body
    end

    it 'Unduplicate models' do
      expect { post create_path('square'), params: { square: '10' } }.to change(Newton, :count).by(1)
    end

    it 'Unmodified models' do
      post create_path('square'), params: { square: '10' }
      expect { post create_path('square'), params: { square: '10' } }.not_to change(Newton, :count)
    end
  end
end
