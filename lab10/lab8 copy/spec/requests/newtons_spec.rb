require 'rails_helper'

RSpec.describe "Newtons", type: :request do
  describe "GET /newtons" do
    it "differenr values" do
      get '/square.xml?square=22'
      page = response.body
      get '/square.xml?square=23'
      expect(response.body).not_to eq(page)
    end
  end
end
