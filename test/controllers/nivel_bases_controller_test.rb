require 'test_helper'

class NivelBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nivel_base = nivel_bases(:one)
  end

  test "should get index" do
    get nivel_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_nivel_base_url
    assert_response :success
  end

  test "should create nivel_base" do
    assert_difference('NivelBase.count') do
      post nivel_bases_url, params: { nivel_base: { nivel_base: @nivel_base.nivel_base, orden: @nivel_base.orden } }
    end

    assert_redirected_to nivel_base_url(NivelBase.last)
  end

  test "should show nivel_base" do
    get nivel_base_url(@nivel_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_nivel_base_url(@nivel_base)
    assert_response :success
  end

  test "should update nivel_base" do
    patch nivel_base_url(@nivel_base), params: { nivel_base: { nivel_base: @nivel_base.nivel_base, orden: @nivel_base.orden } }
    assert_redirected_to nivel_base_url(@nivel_base)
  end

  test "should destroy nivel_base" do
    assert_difference('NivelBase.count', -1) do
      delete nivel_base_url(@nivel_base)
    end

    assert_redirected_to nivel_bases_url
  end
end
