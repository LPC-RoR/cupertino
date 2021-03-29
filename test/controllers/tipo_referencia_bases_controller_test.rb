require 'test_helper'

class TipoReferenciaBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_referencia_base = tipo_referencia_bases(:one)
  end

  test "should get index" do
    get tipo_referencia_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_referencia_base_url
    assert_response :success
  end

  test "should create tipo_referencia_base" do
    assert_difference('TipoReferenciaBase.count') do
      post tipo_referencia_bases_url, params: { tipo_referencia_base: { orden: @tipo_referencia_base.orden, tipo_referencia_base: @tipo_referencia_base.tipo_referencia_base } }
    end

    assert_redirected_to tipo_referencia_base_url(TipoReferenciaBase.last)
  end

  test "should show tipo_referencia_base" do
    get tipo_referencia_base_url(@tipo_referencia_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_referencia_base_url(@tipo_referencia_base)
    assert_response :success
  end

  test "should update tipo_referencia_base" do
    patch tipo_referencia_base_url(@tipo_referencia_base), params: { tipo_referencia_base: { orden: @tipo_referencia_base.orden, tipo_referencia_base: @tipo_referencia_base.tipo_referencia_base } }
    assert_redirected_to tipo_referencia_base_url(@tipo_referencia_base)
  end

  test "should destroy tipo_referencia_base" do
    assert_difference('TipoReferenciaBase.count', -1) do
      delete tipo_referencia_base_url(@tipo_referencia_base)
    end

    assert_redirected_to tipo_referencia_bases_url
  end
end
