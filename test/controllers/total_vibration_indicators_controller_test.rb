require 'test_helper'

class TotalVibrationIndicatorsControllerTest < ActionController::TestCase
  setup do
    @total_vibration_indicator = total_vibration_indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:total_vibration_indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create total_vibration_indicator" do
    assert_difference('TotalVibrationIndicator.count') do
      post :create, total_vibration_indicator: {  }
    end

    assert_redirected_to total_vibration_indicator_path(assigns(:total_vibration_indicator))
  end

  test "should show total_vibration_indicator" do
    get :show, id: @total_vibration_indicator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @total_vibration_indicator
    assert_response :success
  end

  test "should update total_vibration_indicator" do
    patch :update, id: @total_vibration_indicator, total_vibration_indicator: {  }
    assert_redirected_to total_vibration_indicator_path(assigns(:total_vibration_indicator))
  end

  test "should destroy total_vibration_indicator" do
    assert_difference('TotalVibrationIndicator.count', -1) do
      delete :destroy, id: @total_vibration_indicator
    end

    assert_redirected_to total_vibration_indicators_path
  end
end
