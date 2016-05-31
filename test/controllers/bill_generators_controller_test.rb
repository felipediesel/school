require 'test_helper'

class BillGeneratorsControllerTest < ActionController::TestCase
  setup do
    @student = people(:daniel)
  end
  test "should get new" do
    get :new, xhr: true, format: 'js'
    assert_response :success
  end

  test "should create bill" do
    post :create, params: { bill_generator: { reference: Date.today.beginning_of_month } }

    assert_redirected_to bills_path
  end

  test "should get new with student" do
    get :new, xhr: true, format: 'js', params: { student_id: @student }
    assert_response :success
  end

  test "should create bill with student" do
    post :create, params: { bill_generator: {  student_id: @student, reference: Date.today.beginning_of_month } }

    assert_redirected_to bills_path
  end
end
