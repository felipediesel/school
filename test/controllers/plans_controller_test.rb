require 'test_helper'

class PlansControllerTest < ActionController::TestCase
  setup do
    @plan = plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan" do
    assert_difference('Plan.count') do
      post :create, params: { plan: { name: @plan.name } }
    end

    assert_redirected_to plans_path
  end

  test "should show plan" do
    get :show, params: { id: @plan }, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @plan }
    assert_response :success
  end

  test "should update plan" do
    patch :update, params: { id: @plan, plan: { name: @plan.name } }
    assert_redirected_to plans_path
  end

  test "should destroy plan that have no classplan_schedules" do
    plan = plans(:fk_free)
    assert_difference('Plan.count', -1) do
      delete :destroy, params: { id: plan }
    end

    assert_redirected_to plans_path
  end

  test "should not destroy plan that have classplan_schedules" do
    delete :destroy, params: { id: @plan }

    assert_response :method_not_allowed
  end
end
