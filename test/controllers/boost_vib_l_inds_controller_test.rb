require 'test_helper'

class BoostVibLIndsControllerTest < ActionController::TestCase
  setup do
    @boost_vib_l_ind = boost_vib_l_inds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boost_vib_l_inds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boost_vib_l_ind" do
    assert_difference('BoostVibLInd.count') do
      post :create, boost_vib_l_ind: {  }
    end

    assert_redirected_to boost_vib_l_ind_path(assigns(:boost_vib_l_ind))
  end

  test "should show boost_vib_l_ind" do
    get :show, id: @boost_vib_l_ind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boost_vib_l_ind
    assert_response :success
  end

  test "should update boost_vib_l_ind" do
    patch :update, id: @boost_vib_l_ind, boost_vib_l_ind: {  }
    assert_redirected_to boost_vib_l_ind_path(assigns(:boost_vib_l_ind))
  end

  test "should destroy boost_vib_l_ind" do
    assert_difference('BoostVibLInd.count', -1) do
      delete :destroy, id: @boost_vib_l_ind
    end

    assert_redirected_to boost_vib_l_inds_path
  end
end
