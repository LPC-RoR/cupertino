require "application_system_test_case"

class AsignaturaNivelBasesTest < ApplicationSystemTestCase
  setup do
    @asignatura_nivel_base = asignatura_nivel_bases(:one)
  end

  test "visiting the index" do
    visit asignatura_nivel_bases_url
    assert_selector "h1", text: "Asignatura Nivel Bases"
  end

  test "creating a Asignatura nivel base" do
    visit asignatura_nivel_bases_url
    click_on "New Asignatura Nivel Base"

    fill_in "Asignatura base", with: @asignatura_nivel_base.asignatura_base_id
    click_on "Create Asignatura nivel base"

    assert_text "Asignatura nivel base was successfully created"
    click_on "Back"
  end

  test "updating a Asignatura nivel base" do
    visit asignatura_nivel_bases_url
    click_on "Edit", match: :first

    fill_in "Asignatura base", with: @asignatura_nivel_base.asignatura_base_id
    click_on "Update Asignatura nivel base"

    assert_text "Asignatura nivel base was successfully updated"
    click_on "Back"
  end

  test "destroying a Asignatura nivel base" do
    visit asignatura_nivel_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Asignatura nivel base was successfully destroyed"
  end
end
