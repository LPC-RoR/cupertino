require "application_system_test_case"

class CurriculumBasesTest < ApplicationSystemTestCase
  setup do
    @curriculum_base = curriculum_bases(:one)
  end

  test "visiting the index" do
    visit curriculum_bases_url
    assert_selector "h1", text: "Curriculum Bases"
  end

  test "creating a Curriculum base" do
    visit curriculum_bases_url
    click_on "New Curriculum Base"

    fill_in "Curriculum base", with: @curriculum_base.curriculum_base
    fill_in "Orden", with: @curriculum_base.orden
    click_on "Create Curriculum base"

    assert_text "Curriculum base was successfully created"
    click_on "Back"
  end

  test "updating a Curriculum base" do
    visit curriculum_bases_url
    click_on "Edit", match: :first

    fill_in "Curriculum base", with: @curriculum_base.curriculum_base
    fill_in "Orden", with: @curriculum_base.orden
    click_on "Update Curriculum base"

    assert_text "Curriculum base was successfully updated"
    click_on "Back"
  end

  test "destroying a Curriculum base" do
    visit curriculum_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Curriculum base was successfully destroyed"
  end
end
