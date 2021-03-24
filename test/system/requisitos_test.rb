require "application_system_test_case"

class RequisitosTest < ApplicationSystemTestCase
  setup do
    @requisito = requisitos(:one)
  end

  test "visiting the index" do
    visit requisitos_url
    assert_selector "h1", text: "Requisitos"
  end

  test "creating a Requisito" do
    visit requisitos_url
    click_on "New Requisito"

    fill_in "Child", with: @requisito.child_id
    fill_in "Parent", with: @requisito.parent_id
    click_on "Create Requisito"

    assert_text "Requisito was successfully created"
    click_on "Back"
  end

  test "updating a Requisito" do
    visit requisitos_url
    click_on "Edit", match: :first

    fill_in "Child", with: @requisito.child_id
    fill_in "Parent", with: @requisito.parent_id
    click_on "Update Requisito"

    assert_text "Requisito was successfully updated"
    click_on "Back"
  end

  test "destroying a Requisito" do
    visit requisitos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Requisito was successfully destroyed"
  end
end
