require "application_system_test_case"

class LogsTest < ApplicationSystemTestCase
  setup do
    @log = logs(:one)
  end

  test "visiting the index" do
    visit logs_url
    assert_selector "h1", text: "Logs"
  end

  test "should create log" do
    visit logs_url
    click_on "New log"

    fill_in "Error", with: @log.error
    fill_in "In 1", with: @log.in_1
    fill_in "In 2", with: @log.in_2
    fill_in "In 3", with: @log.in_3
    fill_in "Log 0", with: @log.log_0
    fill_in "Origen", with: @log.origen
    click_on "Create Log"

    assert_text "Log was successfully created"
    click_on "Back"
  end

  test "should update Log" do
    visit log_url(@log)
    click_on "Edit this log", match: :first

    fill_in "Error", with: @log.error
    fill_in "In 1", with: @log.in_1
    fill_in "In 2", with: @log.in_2
    fill_in "In 3", with: @log.in_3
    fill_in "Log 0", with: @log.log_0
    fill_in "Origen", with: @log.origen
    click_on "Update Log"

    assert_text "Log was successfully updated"
    click_on "Back"
  end

  test "should destroy Log" do
    visit log_url(@log)
    click_on "Destroy this log", match: :first

    assert_text "Log was successfully destroyed"
  end
end
