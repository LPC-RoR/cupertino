require "application_system_test_case"

class ItemBasesTest < ApplicationSystemTestCase
  setup do
    @item_base = item_bases(:one)
  end

  test "visiting the index" do
    visit item_bases_url
    assert_selector "h1", text: "Item Bases"
  end

  test "creating a Item base" do
    visit item_bases_url
    click_on "New Item Base"

    fill_in "Documento base", with: @item_base.documento_base_id
    fill_in "Item base", with: @item_base.item_base
    fill_in "Orden", with: @item_base.orden
    fill_in "Pagina", with: @item_base.pagina
    fill_in "Tipo", with: @item_base.tipo
    click_on "Create Item base"

    assert_text "Item base was successfully created"
    click_on "Back"
  end

  test "updating a Item base" do
    visit item_bases_url
    click_on "Edit", match: :first

    fill_in "Documento base", with: @item_base.documento_base_id
    fill_in "Item base", with: @item_base.item_base
    fill_in "Orden", with: @item_base.orden
    fill_in "Pagina", with: @item_base.pagina
    fill_in "Tipo", with: @item_base.tipo
    click_on "Update Item base"

    assert_text "Item base was successfully updated"
    click_on "Back"
  end

  test "destroying a Item base" do
    visit item_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item base was successfully destroyed"
  end
end
