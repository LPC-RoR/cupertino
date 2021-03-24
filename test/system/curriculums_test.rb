require "application_system_test_case"

class CurriculumsTest < ApplicationSystemTestCase
  setup do
    @curriculum = curriculums(:one)
  end

  test "visiting the index" do
    visit curriculums_url
    assert_selector "h1", text: "Curriculums"
  end

  test "creating a Curriculum" do
    visit curriculums_url
    click_on "New Curriculum"

    fill_in "Asignatura base", with: @curriculum.asignatura_base_id
    fill_in "Nivel base", with: @curriculum.nivel_base_id
    click_on "Create Curriculum"

    assert_text "Curriculum was successfully created"
    click_on "Back"
  end

  test "updating a Curriculum" do
    visit curriculums_url
    click_on "Edit", match: :first

    fill_in "Asignatura base", with: @curriculum.asignatura_base_id
    fill_in "Nivel base", with: @curriculum.nivel_base_id
    click_on "Update Curriculum"

    assert_text "Curriculum was successfully updated"
    click_on "Back"
  end

  test "destroying a Curriculum" do
    visit curriculums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Curriculum was successfully destroyed"
  end
end
