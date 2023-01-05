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
    get '/something.xml', params: { square: '10' }

    assert_equal 'show', @controller.action_name
    assert_match "<?xml version=\"1.0\" encoding=\"UTF-8\"?>", @response.body
    assert_response :success
  end

  test 'should create newton' do
    get '/something.xml', params: { square: '3' }
  end

  test 'should create different newton' do
    get '/something.xml', params: { square: '3' }
    page =  @response.body
    get '/something.xml', params: { square: '4' }
    assert @response != @response.body
  end

  test 'should not create newton negative' do
    get '/something.xml', params: { square: '-10' }

    assert_equal Nokogiri::XML(@response.body).search("errors").children[0].content, 'Must be greater than zero'
  end

  test 'should not create newton not a float' do
    get '/something.xml', params: { square: 'plus ten' }
    assert_equal Nokogiri::XML(@response.body).search("errors").children[0].content, 'Must be correct float'
  end
end
