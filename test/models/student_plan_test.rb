require 'test_helper'

class StudentPlanTest < ActiveSupport::TestCase
  test "should belongs to student" do
    assert StudentPlan.reflect_on_association(:student).macro == :belongs_to, "StudentPlan should belongs to student"
  end

  test "should belongs to plan" do
    assert StudentPlan.reflect_on_association(:plan).macro == :belongs_to, "StudentPlan should belongs to plan"
  end
end
