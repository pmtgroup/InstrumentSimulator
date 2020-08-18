require 'test_helper'

class MeasurementGaugesControllerTest < ActionController::TestCase
  setup do
    @measurement_gauge = measurement_gauges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:measurement_gauges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create measurement_gauge" do
    assert_difference('MeasurementGauge.count') do
      post :create, measurement_gauge: { control_tool_id: @measurement_gauge.control_tool_id, number_guage: @measurement_gauge.number_guage, number_infrasound_sensor: @measurement_gauge.number_infrasound_sensor, number_local_vibration_sensor1: @measurement_gauge.number_local_vibration_sensor1, number_local_vibration_sensor2: @measurement_gauge.number_local_vibration_sensor2, number_noise_sensor: @measurement_gauge.number_noise_sensor, number_vibration_sensor: @measurement_gauge.number_vibration_sensor }
    end

    assert_redirected_to measurement_gauge_path(assigns(:measurement_gauge))
  end

  test "should show measurement_gauge" do
    get :show, id: @measurement_gauge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @measurement_gauge
    assert_response :success
  end

  test "should update measurement_gauge" do
    patch :update, id: @measurement_gauge, measurement_gauge: { control_tool_id: @measurement_gauge.control_tool_id, number_guage: @measurement_gauge.number_guage, number_infrasound_sensor: @measurement_gauge.number_infrasound_sensor, number_local_vibration_sensor1: @measurement_gauge.number_local_vibration_sensor1, number_local_vibration_sensor2: @measurement_gauge.number_local_vibration_sensor2, number_noise_sensor: @measurement_gauge.number_noise_sensor, number_vibration_sensor: @measurement_gauge.number_vibration_sensor }
    assert_redirected_to measurement_gauge_path(assigns(:measurement_gauge))
  end

  test "should destroy measurement_gauge" do
    assert_difference('MeasurementGauge.count', -1) do
      delete :destroy, id: @measurement_gauge
    end

    assert_redirected_to measurement_gauges_path
  end
end
