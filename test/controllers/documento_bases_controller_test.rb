require 'test_helper'

class DocumentoBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documento_base = documento_bases(:one)
  end

  test "should get index" do
    get documento_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_documento_base_url
    assert_response :success
  end

  test "should create documento_base" do
    assert_difference('DocumentoBase.count') do
      post documento_bases_url, params: { documento_base: { area_base_id: @documento_base.area_base_id, documento: @documento_base.documento, orden: @documento_base.orden } }
    end

    assert_redirected_to documento_base_url(DocumentoBase.last)
  end

  test "should show documento_base" do
    get documento_base_url(@documento_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_documento_base_url(@documento_base)
    assert_response :success
  end

  test "should update documento_base" do
    patch documento_base_url(@documento_base), params: { documento_base: { area_base_id: @documento_base.area_base_id, documento: @documento_base.documento, orden: @documento_base.orden } }
    assert_redirected_to documento_base_url(@documento_base)
  end

  test "should destroy documento_base" do
    assert_difference('DocumentoBase.count', -1) do
      delete documento_base_url(@documento_base)
    end

    assert_redirected_to documento_bases_url
  end
end
