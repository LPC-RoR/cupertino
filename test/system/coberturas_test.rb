require "application_system_test_case"

class CoberturasTest < ApplicationSystemTestCase
  setup do
    @cobertura = coberturas(:one)
  end

  test "visiting the index" do
    visit coberturas_url
    assert_selector "h1", text: "Coberturas"
  end

  test "creating a Cobertura" do
    visit coberturas_url
    click_on "New Cobertura"

    fill_in "Asignatura base", with: @cobertura.asignatura_base_id
    fill_in "Tipo asignatura base", with: @cobertura.tipo_asignatura_base_id
    click_on "Create Cobertura"

    assert_text "Cobertura was successfully created"
    click_on "Back"
  end

  test "updating a Cobertura" do
    visit coberturas_url
    click_on "Edit", match: :first

    fill_in "Asignatura base", with: @cobertura.asignatura_base_id
    fill_in "Tipo asignatura base", with: @cobertura.tipo_asignatura_base_id
    click_on "Update Cobertura"

    assert_text "Cobertura was successfully updated"
    click_on "Back"
  end

  test "destroying a Cobertura" do
    visit coberturas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cobertura was successfully destroyed"
  end
end
