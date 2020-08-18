require 'test_helper'

class BoostVibLsIndsControllerTest < ActionController::TestCase
  setup do
    @boost_vib_ls_ind = boost_vib_ls_inds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boost_vib_ls_inds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boost_vib_ls_ind" do
    assert_difference('BoostVibLsInd.count') do
      post :create, boost_vib_ls_ind: {  }
    end

    assert_redirected_to boost_vib_ls_ind_path(assigns(:boost_vib_ls_ind))
  end

  test "should show boost_vib_ls_ind" do
    get :show, id: @boost_vib_ls_ind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boost_vib_ls_ind
    assert_response :success
  end

  test "should update boost_vib_ls_ind" do
    patch :update, id: @boost_vib_ls_ind, boost_vib_ls_ind: {  }
    assert_redirected_to boost_vib_ls_ind_path(assigns(:boost_vib_ls_ind))
  end

  test "should destroy boost_vib_ls_ind" do
    assert_difference('BoostVibLsInd.count', -1) do
      delete :destroy, id: @boost_vib_ls_ind
    end

    assert_redirected_to boost_vib_ls_inds_path
  end
end
