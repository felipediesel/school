require 'test_helper'

class BillTest < ActiveSupport::TestCase
  test "should belongs to student" do
    assert Bill.reflect_on_association(:student).macro == :belongs_to, "Bill should belongs to student"
  end

  test "should have required validators" do
    bill = Bill.new amount: nil, discount: nil, total: nil
    assert_not bill.valid?
    assert_equal [ :student_id, :description, :amount, :discount, :total, :due_at ], bill.errors.keys
  end

  test "should calculate total" do
    bill = Bill.new amount: 50, discount: 10.5

    assert_equal 39.5, bill.total.to_f, "Bill total should be discounted."
  end
end
