require "application_system_test_case"

class TipoAsignaturaBasesTest < ApplicationSystemTestCase
  setup do
    @tipo_asignatura_base = tipo_asignatura_bases(:one)
  end

  test "visiting the index" do
    visit tipo_asignatura_bases_url
    assert_selector "h1", text: "Tipo Asignatura Bases"
  end

  test "creating a Tipo asignatura base" do
    visit tipo_asignatura_bases_url
    click_on "New Tipo Asignatura Base"

    fill_in "Curriculum base", with: @tipo_asignatura_base.curriculum_base_id
    fill_in "Orden", with: @tipo_asignatura_base.orden
    fill_in "Tipo asignatura", with: @tipo_asignatura_base.tipo_asignatura
    click_on "Create Tipo asignatura base"

    assert_text "Tipo asignatura base was successfully created"
    click_on "Back"
  end

  test "updating a Tipo asignatura base" do
    visit tipo_asignatura_bases_url
    click_on "Edit", match: :first

    fill_in "Curriculum base", with: @tipo_asignatura_base.curriculum_base_id
    fill_in "Orden", with: @tipo_asignatura_base.orden
    fill_in "Tipo asignatura", with: @tipo_asignatura_base.tipo_asignatura
    click_on "Update Tipo asignatura base"

    assert_text "Tipo asignatura base was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo asignatura base" do
    visit tipo_asignatura_bases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo asignatura base was successfully destroyed"
  end
end
