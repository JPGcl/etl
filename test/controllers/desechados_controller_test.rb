require "test_helper"

class DesechadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desechado = desechados(:one)
  end

  test "should get index" do
    get desechados_url
    assert_response :success
  end

  test "should get new" do
    get new_desechado_url
    assert_response :success
  end

  test "should create desechado" do
    assert_difference("Desechado.count") do
      post desechados_url, params: { desechado: { error: @desechado.error, in_1: @desechado.in_1, in_2: @desechado.in_2, in_3: @desechado.in_3, origen: @desechado.origen } }
    end

    assert_redirected_to desechado_url(Desechado.last)
  end

  test "should show desechado" do
    get desechado_url(@desechado)
    assert_response :success
  end

  test "should get edit" do
    get edit_desechado_url(@desechado)
    assert_response :success
  end

  test "should update desechado" do
    patch desechado_url(@desechado), params: { desechado: { error: @desechado.error, in_1: @desechado.in_1, in_2: @desechado.in_2, in_3: @desechado.in_3, origen: @desechado.origen } }
    assert_redirected_to desechado_url(@desechado)
  end

  test "should destroy desechado" do
    assert_difference("Desechado.count", -1) do
      delete desechado_url(@desechado)
    end

    assert_redirected_to desechados_url
  end
end
