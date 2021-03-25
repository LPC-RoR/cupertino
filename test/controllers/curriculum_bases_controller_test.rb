require 'test_helper'

class CurriculumBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curriculum_base = curriculum_bases(:one)
  end

  test "should get index" do
    get curriculum_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_curriculum_base_url
    assert_response :success
  end

  test "should create curriculum_base" do
    assert_difference('CurriculumBase.count') do
      post curriculum_bases_url, params: { curriculum_base: { curriculum_base: @curriculum_base.curriculum_base, orden: @curriculum_base.orden } }
    end

    assert_redirected_to curriculum_base_url(CurriculumBase.last)
  end

  test "should show curriculum_base" do
    get curriculum_base_url(@curriculum_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_curriculum_base_url(@curriculum_base)
    assert_response :success
  end

  test "should update curriculum_base" do
    patch curriculum_base_url(@curriculum_base), params: { curriculum_base: { curriculum_base: @curriculum_base.curriculum_base, orden: @curriculum_base.orden } }
    assert_redirected_to curriculum_base_url(@curriculum_base)
  end

  test "should destroy curriculum_base" do
    assert_difference('CurriculumBase.count', -1) do
      delete curriculum_base_url(@curriculum_base)
    end

    assert_redirected_to curriculum_bases_url
  end
end
