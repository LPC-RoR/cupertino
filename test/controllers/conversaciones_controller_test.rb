require 'test_helper'

class ConversacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conversacion = conversaciones(:one)
  end

  test "should get index" do
    get conversaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_conversacion_url
    assert_response :success
  end

  test "should create conversacion" do
    assert_difference('Conversacion.count') do
      post conversaciones_url, params: { conversacion: { child_id: @conversacion.child_id, parent_id: @conversacion.parent_id } }
    end

    assert_redirected_to conversacion_url(Conversacion.last)
  end

  test "should show conversacion" do
    get conversacion_url(@conversacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_conversacion_url(@conversacion)
    assert_response :success
  end

  test "should update conversacion" do
    patch conversacion_url(@conversacion), params: { conversacion: { child_id: @conversacion.child_id, parent_id: @conversacion.parent_id } }
    assert_redirected_to conversacion_url(@conversacion)
  end

  test "should destroy conversacion" do
    assert_difference('Conversacion.count', -1) do
      delete conversacion_url(@conversacion)
    end

    assert_redirected_to conversaciones_url
  end
end
