require 'test_helper'

class EstructurasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estructura = estructuras(:one)
  end

  test "should get index" do
    get estructuras_url
    assert_response :success
  end

  test "should get new" do
    get new_estructura_url
    assert_response :success
  end

  test "should create estructura" do
    assert_difference('Estructura.count') do
      post estructuras_url, params: { estructura: {  } }
    end

    assert_redirected_to estructura_url(Estructura.last)
  end

  test "should show estructura" do
    get estructura_url(@estructura)
    assert_response :success
  end

  test "should get edit" do
    get edit_estructura_url(@estructura)
    assert_response :success
  end

  test "should update estructura" do
    patch estructura_url(@estructura), params: { estructura: {  } }
    assert_redirected_to estructura_url(@estructura)
  end

  test "should destroy estructura" do
    assert_difference('Estructura.count', -1) do
      delete estructura_url(@estructura)
    end

    assert_redirected_to estructuras_url
  end
end
