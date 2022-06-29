require "application_system_test_case"

class OutputsTest < ApplicationSystemTestCase
  setup do
    @output = outputs(:one)
  end

  test "visiting the index" do
    visit outputs_url
    assert_selector "h1", text: "Outputs"
  end

  test "should create output" do
    visit outputs_url
    click_on "New output"

    fill_in "Out 0", with: @output.out_0
    fill_in "Out 1", with: @output.out_1
    click_on "Create Output"

    assert_text "Output was successfully created"
    click_on "Back"
  end

  test "should update Output" do
    visit output_url(@output)
    click_on "Edit this output", match: :first

    fill_in "Out 0", with: @output.out_0
    fill_in "Out 1", with: @output.out_1
    click_on "Update Output"

    assert_text "Output was successfully updated"
    click_on "Back"
  end

  test "should destroy Output" do
    visit output_url(@output)
    click_on "Destroy this output", match: :first

    assert_text "Output was successfully destroyed"
  end
end
