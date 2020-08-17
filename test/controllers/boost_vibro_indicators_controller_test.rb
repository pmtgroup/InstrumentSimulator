require 'test_helper'

class BoostVibroIndicatorsControllerTest < ActionController::TestCase
  setup do
    @boost_vibro_indicator = boost_vibro_indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boost_vibro_indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boost_vibro_indicator" do
    assert_difference('BoostVibroIndicator.count') do
      post :create, boost_vibro_indicator: {  }
    end

    assert_redirected_to boost_vibro_indicator_path(assigns(:boost_vibro_indicator))
  end

  test "should show boost_vibro_indicator" do
    get :show, id: @boost_vibro_indicator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boost_vibro_indicator
    assert_response :success
  end

  test "should update boost_vibro_indicator" do
    patch :update, id: @boost_vibro_indicator, boost_vibro_indicator: {  }
    assert_redirected_to boost_vibro_indicator_path(assigns(:boost_vibro_indicator))
  end

  test "should destroy boost_vibro_indicator" do
    assert_difference('BoostVibroIndicator.count', -1) do
      delete :destroy, id: @boost_vibro_indicator
    end

    assert_redirected_to boost_vibro_indicators_path
  end
end
