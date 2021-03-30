require 'test_helper'

class TravelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel = travels(:one)
  end

  test 'should get index' do
    get travels_url
    assert_response :success
  end

  test 'should get new' do
    get new_travel_url
    assert_response :success
  end

  test 'should create travel' do
    assert_difference('Travel.count') do
      post travels_url,
           params: { travel: { destination: @travel.destination, distance: @travel.distance, employee_id:
             @travel.employee_id, name: @travel.name, source: @travel.source } }
    end

    assert_redirected_to travel_url(Travel.last)
  end

  test 'should show travel' do
    get travel_url(@travel)
    assert_response :success
  end

  test 'should get edit' do
    get edit_travel_url(@travel)
    assert_response :success
  end

  test 'should update travel' do
    patch travel_url(@travel),
          params: { travel: { destination: @travel.destination, distance: @travel.distance,
                              employee_id: @travel.employee_id, name: @travel.name, source: @travel.source } }
    assert_redirected_to travel_url(@travel)
  end

  test 'should destroy travel' do
    assert_difference('Travel.count', -1) do
      delete travel_url(@travel)
    end

    assert_redirected_to travels_url
  end
end
