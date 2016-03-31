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

  test "should create subscription" do
    assert_difference('Subscription.count') do
      process :create, method: :post, format: :json, params: { student_id: @student, subscription: { classroom_id: @subscription.classroom, schedule_id: @subscription.schedule } }
    end

    assert_response :success
  end

  test "should show subscription" do
    get :show, params: { student_id: @student, id: @subscription }, format: :json
    assert_response :success
  end

  test "should destroy subscription" do
    assert_difference('Subscription.count', -1) do
      delete :destroy, format: :json, params: {student_id: @student, id: @subscription }
    end

    assert_response :success
  end
end
