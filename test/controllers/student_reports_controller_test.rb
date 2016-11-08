require 'test_helper'

class StudentReportsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report pdf" do
    process :create, method: :post, format: :pdf, params: { student_report: {
      classroom_id: '1', plan_id: 1, status: 'active'} }

    assert_not_nil assigns(:students)
    assert_response :success
  end
end
