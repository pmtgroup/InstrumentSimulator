require 'test_helper'

class StaffWorkersControllerTest < ActionController::TestCase
  setup do
    @staff_worker = staff_workers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staff_workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create staff_worker" do
    assert_difference('StaffWorker.count') do
      post :create, staff_worker: { additional_description_operation: @staff_worker.additional_description_operation, additional_work_in_workplace: @staff_worker.additional_work_in_workplace, birthday: @staff_worker.birthday, description_operation: @staff_worker.description_operation, duration_one_shift: @staff_worker.duration_one_shift, duration_work: @staff_worker.duration_work, labor_activity_category: @staff_worker.labor_activity_category, labor_activity_type: @staff_worker.labor_activity_type, name: @staff_worker.name, patronymic: @staff_worker.patronymic, subdivision_id: @staff_worker.subdivision_id, surname: @staff_worker.surname, work_in_workplace: @staff_worker.work_in_workplace, workplace_id: @staff_worker.workplace_id }
    end

    assert_redirected_to staff_worker_path(assigns(:staff_worker))
  end

  test "should show staff_worker" do
    get :show, id: @staff_worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @staff_worker
    assert_response :success
  end

  test "should update staff_worker" do
    patch :update, id: @staff_worker, staff_worker: { additional_description_operation: @staff_worker.additional_description_operation, additional_work_in_workplace: @staff_worker.additional_work_in_workplace, birthday: @staff_worker.birthday, description_operation: @staff_worker.description_operation, duration_one_shift: @staff_worker.duration_one_shift, duration_work: @staff_worker.duration_work, labor_activity_category: @staff_worker.labor_activity_category, labor_activity_type: @staff_worker.labor_activity_type, name: @staff_worker.name, patronymic: @staff_worker.patronymic, subdivision_id: @staff_worker.subdivision_id, surname: @staff_worker.surname, work_in_workplace: @staff_worker.work_in_workplace, workplace_id: @staff_worker.workplace_id }
    assert_redirected_to staff_worker_path(assigns(:staff_worker))
  end

  test "should destroy staff_worker" do
    assert_difference('StaffWorker.count', -1) do
      delete :destroy, id: @staff_worker
    end

    assert_redirected_to staff_workers_path
  end
end
