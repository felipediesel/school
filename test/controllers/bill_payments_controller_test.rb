require 'test_helper'

class BillPaymentsControllerTest < ActionController::TestCase
  setup do
    @bill = bills(:unpaid)
  end

  test "should get new" do
    get :new, xhr: true, format: 'js', params: { bill_id: @bill }
    assert_response :success
  end

  test "should create bill payment" do
    post :create, xhr: true, format: 'js', params: { bill_id: @bill, bill: { discount_formatted: @bill.discount_formatted, paid_at: @bill.paid_at } }

    assert_response :success
  end
end
