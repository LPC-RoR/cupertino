require 'test_helper'

class AreaBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_base = area_bases(:one)
  end

  test "should get index" do
    get area_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_area_base_url
    assert_response :success
  end

  test "should create area_base" do
    assert_difference('AreaBase.count') do
      post area_bases_url, params: { area_base: { area_base: @area_base.area_base, orden: @area_base.orden } }
    end

    assert_redirected_to area_base_url(AreaBase.last)
  end

  test "should show area_base" do
    get area_base_url(@area_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_base_url(@area_base)
    assert_response :success
  end

  test "should update area_base" do
    patch area_base_url(@area_base), params: { area_base: { area_base: @area_base.area_base, orden: @area_base.orden } }
    assert_redirected_to area_base_url(@area_base)
  end

  test "should destroy area_base" do
    assert_difference('AreaBase.count', -1) do
      delete area_base_url(@area_base)
    end

    assert_redirected_to area_bases_url
  end
end
