require 'test_helper'

class SubscriptionBulkUpdatesControllerTest < ActionController::TestCase
  setup do
    @student = people(:daniel)
    @subscription = subscriptions(:one)
    @schedule = classroom_schedules(:jiujitsu)
  end

  test "should get new" do
    get :new, params: { student_id: @student}
    assert_response :success
  end

  test "should update subscriptions" do
    assert_difference('Subscription.count', -1) do # Will be removed one subscription
      process :create, method: :post, params: { student_id: @student, subscription_bulk_updates: [@schedule.id] }
    end
  end
end
