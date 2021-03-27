require 'test_helper'

class TipoAsignaturaBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_asignatura_base = tipo_asignatura_bases(:one)
  end

  test "should get index" do
    get tipo_asignatura_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_asignatura_base_url
    assert_response :success
  end

  test "should create tipo_asignatura_base" do
    assert_difference('TipoAsignaturaBase.count') do
      post tipo_asignatura_bases_url, params: { tipo_asignatura_base: { curriculum_base_id: @tipo_asignatura_base.curriculum_base_id, orden: @tipo_asignatura_base.orden, tipo_asignatura: @tipo_asignatura_base.tipo_asignatura } }
    end

    assert_redirected_to tipo_asignatura_base_url(TipoAsignaturaBase.last)
  end

  test "should show tipo_asignatura_base" do
    get tipo_asignatura_base_url(@tipo_asignatura_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_asignatura_base_url(@tipo_asignatura_base)
    assert_response :success
  end

  test "should update tipo_asignatura_base" do
    patch tipo_asignatura_base_url(@tipo_asignatura_base), params: { tipo_asignatura_base: { curriculum_base_id: @tipo_asignatura_base.curriculum_base_id, orden: @tipo_asignatura_base.orden, tipo_asignatura: @tipo_asignatura_base.tipo_asignatura } }
    assert_redirected_to tipo_asignatura_base_url(@tipo_asignatura_base)
  end

  test "should destroy tipo_asignatura_base" do
    assert_difference('TipoAsignaturaBase.count', -1) do
      delete tipo_asignatura_base_url(@tipo_asignatura_base)
    end

    assert_redirected_to tipo_asignatura_bases_url
  end
end
