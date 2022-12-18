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

  test 'should create newton meta' do
    post '/', params: { square: '10' }

    assert_equal 'create', @controller.action_name
    assert_match 'Value calculation steps', @response.body
    assert_response :success
  end

  test 'should create newton' do
    post '/', params: { square: '3' }

    assert_select 'span.answer', get_newton_rufson_steps(3).last.to_s
  end

  test 'should not create newton negative' do
    post '/', params: { square: '-10' }

    assert_select 'p.error', 'Must be greather than zero'
  end

  test 'should not create newton not a float' do
    post '/', params: { square: 'plus ten' }

    assert_select 'p.error', 'Must be correct float'
  end
end
