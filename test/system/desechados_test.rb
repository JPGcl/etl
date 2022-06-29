require "application_system_test_case"

class DesechadosTest < ApplicationSystemTestCase
  setup do
    @desechado = desechados(:one)
  end

  test "visiting the index" do
    visit desechados_url
    assert_selector "h1", text: "Desechados"
  end

  test "should create desechado" do
    visit desechados_url
    click_on "New desechado"

    fill_in "Error", with: @desechado.error
    fill_in "In 1", with: @desechado.in_1
    fill_in "In 2", with: @desechado.in_2
    fill_in "In 3", with: @desechado.in_3
    fill_in "Origen", with: @desechado.origen
    click_on "Create Desechado"

    assert_text "Desechado was successfully created"
    click_on "Back"
  end

  test "should update Desechado" do
    visit desechado_url(@desechado)
    click_on "Edit this desechado", match: :first

    fill_in "Error", with: @desechado.error
    fill_in "In 1", with: @desechado.in_1
    fill_in "In 2", with: @desechado.in_2
    fill_in "In 3", with: @desechado.in_3
    fill_in "Origen", with: @desechado.origen
    click_on "Update Desechado"

    assert_text "Desechado was successfully updated"
    click_on "Back"
  end

  test "should destroy Desechado" do
    visit desechado_url(@desechado)
    click_on "Destroy this desechado", match: :first

    assert_text "Desechado was successfully destroyed"
  end
end
