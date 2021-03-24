require "application_system_test_case"

class DocumentoBasesTest < ApplicationSystemTestCase
  setup do
    @documento_base = documento_bases(:one)
  end

  test "visiting the index" do
    visit documento_bases_url
    assert_selector "h1", text: "Documento Bases"
  end

  test "creating a Documento base" do
    visit documento_bases_url
    click_on "New Documento Base"

    fill_in "Area base", with: @documento_base.area_base_id
    fill_in "Documento", with: @documento_base.documento
    fill_in "Orden", with: @documento_base.orden
    click_on "Create Documento base"

    assert_text "Documento base was successfully created"
    click_on "Back"
  end

  test "updating a Documento base" do
    visit documento_bases_url
    click_on "Edit", match: :first

    fill_in "Area base", with: @documento_base.area_base_id
    fill_in "Documento", with: @documento_base.documento
    fill_in "Orden", with: @documento_base.orden
    click_on "Update Documento base"

    assert_text "Documento base was successfully updated"
    click_on "Back"
  end

  test "destroying a Documento base" do
    visit documento_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Documento base was successfully destroyed"
  end
end
