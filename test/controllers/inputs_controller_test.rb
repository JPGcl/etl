require "test_helper"

class InputsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @input = inputs(:one)
  end

  test "should get index" do
    get inputs_url
    assert_response :success
  end

  test "should get new" do
    get new_input_url
    assert_response :success
  end

  test "should create input" do
    assert_difference("Input.count") do
      post inputs_url, params: { input: { in_0: @input.in_0, in_1: @input.in_1, in_2: @input.in_2 } }
    end

    assert_redirected_to input_url(Input.last)
  end

  test "should show input" do
    get input_url(@input)
    assert_response :success
  end

  test "should get edit" do
    get edit_input_url(@input)
    assert_response :success
  end

  test "should update input" do
    patch input_url(@input), params: { input: { in_0: @input.in_0, in_1: @input.in_1, in_2: @input.in_2 } }
    assert_redirected_to input_url(@input)
  end

  test "should destroy input" do
    assert_difference("Input.count", -1) do
      delete input_url(@input)
    end

    assert_redirected_to inputs_url
  end
end
