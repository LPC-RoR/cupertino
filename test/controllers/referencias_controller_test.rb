require 'test_helper'

class ReferenciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referencia = referencias(:one)
  end

  test "should get index" do
    get referencias_url
    assert_response :success
  end

  test "should get new" do
    get new_referencia_url
    assert_response :success
  end

  test "should create referencia" do
    assert_difference('Referencia.count') do
      post referencias_url, params: { referencia: { asignatura_base_id: @referencia.asignatura_base_id, documento_base_id: @referencia.documento_base_id, nivel_base_id: @referencia.nivel_base_id } }
    end

    assert_redirected_to referencia_url(Referencia.last)
  end

  test "should show referencia" do
    get referencia_url(@referencia)
    assert_response :success
  end

  test "should get edit" do
    get edit_referencia_url(@referencia)
    assert_response :success
  end

  test "should update referencia" do
    patch referencia_url(@referencia), params: { referencia: { asignatura_base_id: @referencia.asignatura_base_id, documento_base_id: @referencia.documento_base_id, nivel_base_id: @referencia.nivel_base_id } }
    assert_redirected_to referencia_url(@referencia)
  end

  test "should destroy referencia" do
    assert_difference('Referencia.count', -1) do
      delete referencia_url(@referencia)
    end

    assert_redirected_to referencias_url
  end
end
