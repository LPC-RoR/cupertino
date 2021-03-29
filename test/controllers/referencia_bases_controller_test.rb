require 'test_helper'

class ReferenciaBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @referencia_base = referencia_bases(:one)
  end

  test "should get index" do
    get referencia_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_referencia_base_url
    assert_response :success
  end

  test "should create referencia_base" do
    assert_difference('ReferenciaBase.count') do
      post referencia_bases_url, params: { referencia_base: { referencia_base: @referencia_base.referencia_base, seccion: @referencia_base.seccion, tipo_referencia_base_id: @referencia_base.tipo_referencia_base_id } }
    end

    assert_redirected_to referencia_base_url(ReferenciaBase.last)
  end

  test "should show referencia_base" do
    get referencia_base_url(@referencia_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_referencia_base_url(@referencia_base)
    assert_response :success
  end

  test "should update referencia_base" do
    patch referencia_base_url(@referencia_base), params: { referencia_base: { referencia_base: @referencia_base.referencia_base, seccion: @referencia_base.seccion, tipo_referencia_base_id: @referencia_base.tipo_referencia_base_id } }
    assert_redirected_to referencia_base_url(@referencia_base)
  end

  test "should destroy referencia_base" do
    assert_difference('ReferenciaBase.count', -1) do
      delete referencia_base_url(@referencia_base)
    end

    assert_redirected_to referencia_bases_url
  end
end
