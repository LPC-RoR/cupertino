require "application_system_test_case"

class ConversacionesTest < ApplicationSystemTestCase
  setup do
    @conversacion = conversaciones(:one)
  end

  test "visiting the index" do
    visit conversaciones_url
    assert_selector "h1", text: "Conversaciones"
  end

  test "creating a Conversacion" do
    visit conversaciones_url
    click_on "New Conversacion"

    fill_in "Child", with: @conversacion.child_id
    fill_in "Parent", with: @conversacion.parent_id
    click_on "Create Conversacion"

    assert_text "Conversacion was successfully created"
    click_on "Back"
  end

  test "updating a Conversacion" do
    visit conversaciones_url
    click_on "Edit", match: :first

    fill_in "Child", with: @conversacion.child_id
    fill_in "Parent", with: @conversacion.parent_id
    click_on "Update Conversacion"

    assert_text "Conversacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Conversacion" do
    visit conversaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conversacion was successfully destroyed"
  end
end
