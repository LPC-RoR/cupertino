require "application_system_test_case"

class AreaBasesTest < ApplicationSystemTestCase
  setup do
    @area_base = area_bases(:one)
  end

  test "visiting the index" do
    visit area_bases_url
    assert_selector "h1", text: "Area Bases"
  end

  test "creating a Area base" do
    visit area_bases_url
    click_on "New Area Base"

    fill_in "Area base", with: @area_base.area_base
    fill_in "Orden", with: @area_base.orden
    click_on "Create Area base"

    assert_text "Area base was successfully created"
    click_on "Back"
  end

  test "updating a Area base" do
    visit area_bases_url
    click_on "Edit", match: :first

    fill_in "Area base", with: @area_base.area_base
    fill_in "Orden", with: @area_base.orden
    click_on "Update Area base"

    assert_text "Area base was successfully updated"
    click_on "Back"
  end

  test "destroying a Area base" do
    visit area_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Area base was successfully destroyed"
  end
end
