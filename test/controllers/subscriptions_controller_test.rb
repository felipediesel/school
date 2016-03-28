require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  setup do
    @student = people(:daniel)
    @subscription = subscriptions(:one)
  end

  test "should get index" do
    get :index, params: { student_id: @student }
    assert_response :success
    assert_not_nil assigns(:subscriptions)
  end

  test "should get new" do
    get :new, params: { student_id: @student }
    assert_response :success
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      process :create, method: :post, params: { student_id: @student, subscription: { classroom_id: @subscription.classroom } }
    end

    assert_redirected_to student_subscriptions_path(@student)
  end

  test "should show subscription" do
    get :show, params: { student_id: @student, id: @subscription }, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { student_id: @student, id: @subscription }
    assert_response :success
  end

  test "should update subscription" do
    process :update, method: :post, params: { student_id: @student, id: @subscription, subscription: { classroom_id: @subscription.classroom } }
    assert_redirected_to student_subscriptions_path(@student)
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete :destroy, params: {student_id: @student, id: @subscription }
    end

    assert_redirected_to student_subscriptions_path(@student)
  end
end
