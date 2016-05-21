require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  setup do
    @bill = bills(:paid)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill" do
    assert_difference('Bill.count') do
      post :create, params: { bill: { amount_formatted: @bill.amount_formatted, description: @bill.description, discount_formatted: @bill.discount_formatted, paid_at: @bill.paid_at, due_at: @bill.due_at, student_id: @bill.student_id } }
    end

    assert_redirected_to bills_path
  end

  test "should get edit" do
    get :edit, params: { id: @bill }
    assert_response :success
  end

  test "should update bill" do
    patch :update, params: { id: @bill, bill: { amount_formatted: @bill.amount_formatted, description: @bill.description, discount_formatted: @bill.discount_formatted, paid_at: @bill.paid_at, due_at: @bill.due_at, student_id: @bill.student_id } }
    assert_redirected_to bills_path
  end

  test "should destroy bill" do
    assert_difference('Bill.count', -1) do
      delete :destroy, params: { id: @bill }
    end

    assert_redirected_to bills_path
  end
end
