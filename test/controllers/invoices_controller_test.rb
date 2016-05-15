require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
  setup do
    @student = people(:daniel)
  end

  test "should get new" do
    get :new, xhr: true, format: 'js', params: { student_id: @student.id }
    assert_response :success
  end

  test "should create invoice pdf" do
    process :create, method: :post, format: :pdf, params: { student_id: @student,
      invoice: { first_month: "2016-05-01", months: "6", comment: "" } }

    assert_not_nil assigns(:invoice_options)
    assert_response :success
  end
end
