require 'test_helper'

class AsignaturaNivelBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asignatura_nivel_base = asignatura_nivel_bases(:one)
  end

  test "should get index" do
    get asignatura_nivel_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_asignatura_nivel_base_url
    assert_response :success
  end

  test "should create asignatura_nivel_base" do
    assert_difference('AsignaturaNivelBase.count') do
      post asignatura_nivel_bases_url, params: { asignatura_nivel_base: { asignatura_base_id: @asignatura_nivel_base.asignatura_base_id } }
    end

    assert_redirected_to asignatura_nivel_base_url(AsignaturaNivelBase.last)
  end

  test "should show asignatura_nivel_base" do
    get asignatura_nivel_base_url(@asignatura_nivel_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_asignatura_nivel_base_url(@asignatura_nivel_base)
    assert_response :success
  end

  test "should update asignatura_nivel_base" do
    patch asignatura_nivel_base_url(@asignatura_nivel_base), params: { asignatura_nivel_base: { asignatura_base_id: @asignatura_nivel_base.asignatura_base_id } }
    assert_redirected_to asignatura_nivel_base_url(@asignatura_nivel_base)
  end

  test "should destroy asignatura_nivel_base" do
    assert_difference('AsignaturaNivelBase.count', -1) do
      delete asignatura_nivel_base_url(@asignatura_nivel_base)
    end

    assert_redirected_to asignatura_nivel_bases_url
  end
end
