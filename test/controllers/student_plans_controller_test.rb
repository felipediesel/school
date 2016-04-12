require 'test_helper'

class StudentPlansControllerTest < ActionController::TestCase
  setup do
    @student = people(:daniel)
    @student_plan = student_plans(:one)
  end

  test "should get index" do
    get :index, params: { student_id: @student }
    assert_response :success
    assert_not_nil assigns(:student_plans)
  end

  test "should get new" do
    get :new, params: { student_id: @student }
    assert_response :success
  end

  test "should create student_plan" do
    assert_difference('StudentPlan.count') do
      process :create, method: :post, params: { student_id: @student, student_plan: { plan_id: plans(:two), discount: @student_plan.discount } }
    end

    assert_redirected_to student_student_plans_path(@student)
  end

  test "should show student_plan" do
    get :show, params: { student_id: @student, id: @student_plan }, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { student_id: @student, id: @student_plan }
    assert_response :success
  end

  test "should update student_plan" do
    process :update, method: :post, params: { student_id: @student, id: @student_plan, student_plan: { plan_id: @student_plan.plan_id, discount: @student_plan.discount } }
    assert_redirected_to student_student_plans_path(@student)
  end

  test "should destroy student_plan" do
    assert_difference('StudentPlan.count', -1) do
      delete :destroy, params: {student_id: @student, id: @student_plan }
    end

    assert_redirected_to student_student_plans_path(@student)
  end
end
