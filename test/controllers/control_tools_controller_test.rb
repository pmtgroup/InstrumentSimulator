require 'test_helper'

class ControlToolsControllerTest < ActionController::TestCase
  setup do
    @control_tool = control_tools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_tools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_tool" do
    assert_difference('ControlTool.count') do
      post :create, control_tool: { workpoint_id: @control_tool.workpoint_id }
    end

    assert_redirected_to control_tool_path(assigns(:control_tool))
  end

  test "should show control_tool" do
    get :show, id: @control_tool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_tool
    assert_response :success
  end

  test "should update control_tool" do
    patch :update, id: @control_tool, control_tool: { workpoint_id: @control_tool.workpoint_id }
    assert_redirected_to control_tool_path(assigns(:control_tool))
  end

  test "should destroy control_tool" do
    assert_difference('ControlTool.count', -1) do
      delete :destroy, id: @control_tool
    end

    assert_redirected_to control_tools_path
  end
end
