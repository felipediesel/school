require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  test "should have required validators" do
    plan = Plan.new amount: nil
    assert_not plan.valid?
    assert_equal [ :name, :amount ], plan.errors.keys
  end
end
