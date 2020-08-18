require 'test_helper'

class NoiseIndicatorsControllerTest < ActionController::TestCase
  setup do
    @noise_indicator = noise_indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:noise_indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create noise_indicator" do
    assert_difference('NoiseIndicator.count') do
      post :create, noise_indicator: {  }
    end

    assert_redirected_to noise_indicator_path(assigns(:noise_indicator))
  end

  test "should show noise_indicator" do
    get :show, id: @noise_indicator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @noise_indicator
    assert_response :success
  end

  test "should update noise_indicator" do
    patch :update, id: @noise_indicator, noise_indicator: {  }
    assert_redirected_to noise_indicator_path(assigns(:noise_indicator))
  end

  test "should destroy noise_indicator" do
    assert_difference('NoiseIndicator.count', -1) do
      delete :destroy, id: @noise_indicator
    end

    assert_redirected_to noise_indicators_path
  end
end
