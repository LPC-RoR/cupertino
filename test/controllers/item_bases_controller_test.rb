require 'test_helper'

class ItemBasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_base = item_bases(:one)
  end

  test "should get index" do
    get item_bases_url
    assert_response :success
  end

  test "should get new" do
    get new_item_base_url
    assert_response :success
  end

  test "should create item_base" do
    assert_difference('ItemBase.count') do
      post item_bases_url, params: { item_base: { documento_base_id: @item_base.documento_base_id, item_base: @item_base.item_base, orden: @item_base.orden, pagina: @item_base.pagina, tipo: @item_base.tipo } }
    end

    assert_redirected_to item_base_url(ItemBase.last)
  end

  test "should show item_base" do
    get item_base_url(@item_base)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_base_url(@item_base)
    assert_response :success
  end

  test "should update item_base" do
    patch item_base_url(@item_base), params: { item_base: { documento_base_id: @item_base.documento_base_id, item_base: @item_base.item_base, orden: @item_base.orden, pagina: @item_base.pagina, tipo: @item_base.tipo } }
    assert_redirected_to item_base_url(@item_base)
  end

  test "should destroy item_base" do
    assert_difference('ItemBase.count', -1) do
      delete item_base_url(@item_base)
    end

    assert_redirected_to item_bases_url
  end
end
