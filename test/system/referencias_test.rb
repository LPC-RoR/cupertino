require "application_system_test_case"

class ReferenciasTest < ApplicationSystemTestCase
  setup do
    @referencia = referencias(:one)
  end

  test "visiting the index" do
    visit referencias_url
    assert_selector "h1", text: "Referencias"
  end

  test "creating a Referencia" do
    visit referencias_url
    click_on "New Referencia"

    fill_in "Asignatura base", with: @referencia.asignatura_base_id
    fill_in "Documento base", with: @referencia.documento_base_id
    fill_in "Nivel base", with: @referencia.nivel_base_id
    click_on "Create Referencia"

    assert_text "Referencia was successfully created"
    click_on "Back"
  end

  test "updating a Referencia" do
    visit referencias_url
    click_on "Edit", match: :first

    fill_in "Asignatura base", with: @referencia.asignatura_base_id
    fill_in "Documento base", with: @referencia.documento_base_id
    fill_in "Nivel base", with: @referencia.nivel_base_id
    click_on "Update Referencia"

    assert_text "Referencia was successfully updated"
    click_on "Back"
  end

  test "destroying a Referencia" do
    visit referencias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Referencia was successfully destroyed"
  end
end
