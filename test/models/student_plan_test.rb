require 'test_helper'

class StudentPlanTest < ActiveSupport::TestCase
  test "should belongs to student" do
    assert StudentPlan.reflect_on_association(:student).macro == :belongs_to, "StudentPlan should belongs to student"
  end

  test "should belongs to plan" do
    assert StudentPlan.reflect_on_association(:plan).macro == :belongs_to, "StudentPlan should belongs to plan"
  end

  test "should calculate total_amount" do
    student_plan = StudentPlan.new plan: Plan.new(amount: 50), discount: 15

    assert_equal student_plan.total_amount.to_f, 42.5, "StudentPlan total_amount should be discounted."

  end
end
