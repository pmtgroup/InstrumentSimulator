require 'test_helper'

class LocalVibFIndicatorsControllerTest < ActionController::TestCase
  setup do
    @local_vib_f_indicator = local_vib_f_indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_vib_f_indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_vib_f_indicator" do
    assert_difference('LocalVibFIndicator.count') do
      post :create, local_vib_f_indicator: {  }
    end

    assert_redirected_to local_vib_f_indicator_path(assigns(:local_vib_f_indicator))
  end

  test "should show local_vib_f_indicator" do
    get :show, id: @local_vib_f_indicator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_vib_f_indicator
    assert_response :success
  end

  test "should update local_vib_f_indicator" do
    patch :update, id: @local_vib_f_indicator, local_vib_f_indicator: {  }
    assert_redirected_to local_vib_f_indicator_path(assigns(:local_vib_f_indicator))
  end

  test "should destroy local_vib_f_indicator" do
    assert_difference('LocalVibFIndicator.count', -1) do
      delete :destroy, id: @local_vib_f_indicator
    end

    assert_redirected_to local_vib_f_indicators_path
  end
end
