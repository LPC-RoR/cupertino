require 'test_helper'

class RequisitosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requisito = requisitos(:one)
  end

  test "should get index" do
    get requisitos_url
    assert_response :success
  end

  test "should get new" do
    get new_requisito_url
    assert_response :success
  end

  test "should create requisito" do
    assert_difference('Requisito.count') do
      post requisitos_url, params: { requisito: { child_id: @requisito.child_id, parent_id: @requisito.parent_id } }
    end

    assert_redirected_to requisito_url(Requisito.last)
  end

  test "should show requisito" do
    get requisito_url(@requisito)
    assert_response :success
  end

  test "should get edit" do
    get edit_requisito_url(@requisito)
    assert_response :success
  end

  test "should update requisito" do
    patch requisito_url(@requisito), params: { requisito: { child_id: @requisito.child_id, parent_id: @requisito.parent_id } }
    assert_redirected_to requisito_url(@requisito)
  end

  test "should destroy requisito" do
    assert_difference('Requisito.count', -1) do
      delete requisito_url(@requisito)
    end

    assert_redirected_to requisitos_url
  end
end
