require "application_system_test_case"

class TipoReferenciaBasesTest < ApplicationSystemTestCase
  setup do
    @tipo_referencia_base = tipo_referencia_bases(:one)
  end

  test "visiting the index" do
    visit tipo_referencia_bases_url
    assert_selector "h1", text: "Tipo Referencia Bases"
  end

  test "creating a Tipo referencia base" do
    visit tipo_referencia_bases_url
    click_on "New Tipo Referencia Base"

    fill_in "Orden", with: @tipo_referencia_base.orden
    fill_in "Tipo referencia base", with: @tipo_referencia_base.tipo_referencia_base
    click_on "Create Tipo referencia base"

    assert_text "Tipo referencia base was successfully created"
    click_on "Back"
  end

  test "updating a Tipo referencia base" do
    visit tipo_referencia_bases_url
    click_on "Edit", match: :first

    fill_in "Orden", with: @tipo_referencia_base.orden
    fill_in "Tipo referencia base", with: @tipo_referencia_base.tipo_referencia_base
    click_on "Update Tipo referencia base"

    assert_text "Tipo referencia base was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo referencia base" do
    visit tipo_referencia_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo referencia base was successfully destroyed"
  end
end
