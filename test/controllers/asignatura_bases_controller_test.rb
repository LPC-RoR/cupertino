require 'test_helper'

class AsignaturaBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asignatura_base = asignatura_bases(:one)
  end

  test "should get index" do
    get asignatura_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_asignatura_base_url
    assert_response :success
  end

  test "should create asignatura_base" do
    assert_difference('AsignaturaBase.count') do
      post asignatura_bases_url, params: { asignatura_base: { asignatura: @asignatura_base.asignatura } }
    end

    assert_redirected_to asignatura_base_url(AsignaturaBase.last)
  end

  test "should show asignatura_base" do
    get asignatura_base_url(@asignatura_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_asignatura_base_url(@asignatura_base)
    assert_response :success
  end

  test "should update asignatura_base" do
    patch asignatura_base_url(@asignatura_base), params: { asignatura_base: { asignatura: @asignatura_base.asignatura } }
    assert_redirected_to asignatura_base_url(@asignatura_base)
  end

  test "should destroy asignatura_base" do
    assert_difference('AsignaturaBase.count', -1) do
      delete asignatura_base_url(@asignatura_base)
    end

    assert_redirected_to asignatura_bases_url
  end
end
