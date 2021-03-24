require "application_system_test_case"

class AsignaturaBasesTest < ApplicationSystemTestCase
  setup do
    @asignatura_base = asignatura_bases(:one)
  end

  test "visiting the index" do
    visit asignatura_bases_url
    assert_selector "h1", text: "Asignatura Bases"
  end

  test "creating a Asignatura base" do
    visit asignatura_bases_url
    click_on "New Asignatura Base"

    fill_in "Asignatura", with: @asignatura_base.asignatura
    click_on "Create Asignatura base"

    assert_text "Asignatura base was successfully created"
    click_on "Back"
  end

  test "updating a Asignatura base" do
    visit asignatura_bases_url
    click_on "Edit", match: :first

    fill_in "Asignatura", with: @asignatura_base.asignatura
    click_on "Update Asignatura base"

    assert_text "Asignatura base was successfully updated"
    click_on "Back"
  end

  test "destroying a Asignatura base" do
    visit asignatura_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Asignatura base was successfully destroyed"
  end
end
