require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  test "should have student" do
    assert Subscription.reflect_on_association(:student).macro == :belongs_to, "Modality should belongs to student"
  end

  test "should have classroom" do
    assert Subscription.reflect_on_association(:classroom).macro == :belongs_to, "Modality should belongs to classroom"
  end

  test "should have required validators" do
    subscription = Subscription.new
    assert_not subscription.valid?
    assert_equal [:student, :classroom], subscription.errors.keys
  end
end
