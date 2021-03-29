require "application_system_test_case"

class ReferenciaBasesTest < ApplicationSystemTestCase
  setup do
    @referencia_base = referencia_bases(:one)
  end

  test "visiting the index" do
    visit referencia_bases_url
    assert_selector "h1", text: "Referencia Bases"
  end

  test "creating a Referencia base" do
    visit referencia_bases_url
    click_on "New Referencia Base"

    fill_in "Referencia base", with: @referencia_base.referencia_base
    fill_in "Seccion", with: @referencia_base.seccion
    fill_in "Tipo referencia base", with: @referencia_base.tipo_referencia_base_id
    click_on "Create Referencia base"

    assert_text "Referencia base was successfully created"
    click_on "Back"
  end

  test "updating a Referencia base" do
    visit referencia_bases_url
    click_on "Edit", match: :first

    fill_in "Referencia base", with: @referencia_base.referencia_base
    fill_in "Seccion", with: @referencia_base.seccion
    fill_in "Tipo referencia base", with: @referencia_base.tipo_referencia_base_id
    click_on "Update Referencia base"

    assert_text "Referencia base was successfully updated"
    click_on "Back"
  end

  test "destroying a Referencia base" do
    visit referencia_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referencia base was successfully destroyed"
  end
end
