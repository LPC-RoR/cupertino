require "application_system_test_case"

class ContenidoBasesTest < ApplicationSystemTestCase
  setup do
    @contenido_base = contenido_bases(:one)
  end

  test "visiting the index" do
    visit contenido_bases_url
    assert_selector "h1", text: "Contenido Bases"
  end

  test "creating a Contenido base" do
    visit contenido_bases_url
    click_on "New Contenido Base"

    fill_in "Asignatura nivel base", with: @contenido_base.asignatura_nivel_base_id
    fill_in "Contenido base", with: @contenido_base.contenido_base
    click_on "Create Contenido base"

    assert_text "Contenido base was successfully created"
    click_on "Back"
  end

  test "updating a Contenido base" do
    visit contenido_bases_url
    click_on "Edit", match: :first

    fill_in "Asignatura nivel base", with: @contenido_base.asignatura_nivel_base_id
    fill_in "Contenido base", with: @contenido_base.contenido_base
    click_on "Update Contenido base"

    assert_text "Contenido base was successfully updated"
    click_on "Back"
  end

  test "destroying a Contenido base" do
    visit contenido_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contenido base was successfully destroyed"
  end
end
