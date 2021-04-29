require 'test_helper'

class ContenidoBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contenido_base = contenido_bases(:one)
  end

  test "should get index" do
    get contenido_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_contenido_base_url
    assert_response :success
  end

  test "should create contenido_base" do
    assert_difference('ContenidoBase.count') do
      post contenido_bases_url, params: { contenido_base: { asignatura_nivel_base_id: @contenido_base.asignatura_nivel_base_id, contenido_base: @contenido_base.contenido_base } }
    end

    assert_redirected_to contenido_base_url(ContenidoBase.last)
  end

  test "should show contenido_base" do
    get contenido_base_url(@contenido_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_contenido_base_url(@contenido_base)
    assert_response :success
  end

  test "should update contenido_base" do
    patch contenido_base_url(@contenido_base), params: { contenido_base: { asignatura_nivel_base_id: @contenido_base.asignatura_nivel_base_id, contenido_base: @contenido_base.contenido_base } }
    assert_redirected_to contenido_base_url(@contenido_base)
  end

  test "should destroy contenido_base" do
    assert_difference('ContenidoBase.count', -1) do
      delete contenido_base_url(@contenido_base)
    end

    assert_redirected_to contenido_bases_url
  end
end
