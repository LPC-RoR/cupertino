require "application_system_test_case"

class NivelBasesTest < ApplicationSystemTestCase
  setup do
    @nivel_base = nivel_bases(:one)
  end

  test "visiting the index" do
    visit nivel_bases_url
    assert_selector "h1", text: "Nivel Bases"
  end

  test "creating a Nivel base" do
    visit nivel_bases_url
    click_on "New Nivel Base"

    fill_in "Nivel base", with: @nivel_base.nivel_base
    fill_in "Orden", with: @nivel_base.orden
    click_on "Create Nivel base"

    assert_text "Nivel base was successfully created"
    click_on "Back"
  end

  test "updating a Nivel base" do
    visit nivel_bases_url
    click_on "Edit", match: :first

    fill_in "Nivel base", with: @nivel_base.nivel_base
    fill_in "Orden", with: @nivel_base.orden
    click_on "Update Nivel base"

    assert_text "Nivel base was successfully updated"
    click_on "Back"
  end

  test "destroying a Nivel base" do
    visit nivel_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nivel base was successfully destroyed"
  end
end
