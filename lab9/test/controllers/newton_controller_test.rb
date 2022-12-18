# frozen_string_literal: true

require 'test_helper'

class NewtonControllerTest < ActionDispatch::IntegrationTest
  include NewtonHelper
  test 'should get new' do
    get '/'

    assert_response :success
  end

  test 'should get new with right handlers' do
    get '/'

    assert_equal 'new', @controller.action_name
    assert_match 'Newton', @response.body
  end
end
