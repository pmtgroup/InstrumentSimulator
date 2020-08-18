require 'test_helper'

class WorkingOperationsControllerTest < ActionController::TestCase
  setup do
    @working_operation = working_operations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:working_operations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create working_operation" do
    assert_difference('WorkingOperation.count') do
      post :create, working_operation: { date_of_operation: @working_operation.date_of_operation, duration_shift: @working_operation.duration_shift, staf_worker_id: @working_operation.staf_worker_id }
    end

    assert_redirected_to working_operation_path(assigns(:working_operation))
  end

  test "should show working_operation" do
    get :show, id: @working_operation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @working_operation
    assert_response :success
  end

  test "should update working_operation" do
    patch :update, id: @working_operation, working_operation: { date_of_operation: @working_operation.date_of_operation, duration_shift: @working_operation.duration_shift, staf_worker_id: @working_operation.staf_worker_id }
    assert_redirected_to working_operation_path(assigns(:working_operation))
  end

  test "should destroy working_operation" do
    assert_difference('WorkingOperation.count', -1) do
      delete :destroy, id: @working_operation
    end

    assert_redirected_to working_operations_path
  end
end
