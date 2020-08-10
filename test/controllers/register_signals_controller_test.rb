require 'test_helper'

class RegisterSignalsControllerTest < ActionController::TestCase
  setup do
    @register_signal = register_signals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:register_signals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create register_signal" do
    assert_difference('RegisterSignal.count') do
      post :create, register_signal: { control_tool_id: @register_signal.control_tool_id, number: @register_signal.number }
    end

    assert_redirected_to register_signal_path(assigns(:register_signal))
  end

  test "should show register_signal" do
    get :show, id: @register_signal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @register_signal
    assert_response :success
  end

  test "should update register_signal" do
    patch :update, id: @register_signal, register_signal: { control_tool_id: @register_signal.control_tool_id, number: @register_signal.number }
    assert_redirected_to register_signal_path(assigns(:register_signal))
  end

  test "should destroy register_signal" do
    assert_difference('RegisterSignal.count', -1) do
      delete :destroy, id: @register_signal
    end

    assert_redirected_to register_signals_path
  end
end
