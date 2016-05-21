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

    assert_equal 39.5, bill.total.to_f, "Bill total should be discounted"
  end

  test "should be paid if paid_at is blank" do
    bill = Bill.new

    assert_not bill.paid, "Bill should not be paid"
  end

  test "should be paid if paid_at is present" do
    bill = Bill.new paid_at: Date.today

    assert bill.paid, "Bill should be paid"
  end

  test "should set paid_at to today if paid is true" do
    [true, 'true', '1'].each do |value|
      bill = Bill.new paid: value

      assert_equal bill.paid_at, Date.today, "Bill paid_at should be today"
    end
  end

  test "should not change paid_at if paid is set when changing paid to true" do
    pay_date = Date.today - 3.days
    bill = Bill.new paid_at: pay_date
    bill.paid = true

    assert_equal bill.paid_at, pay_date, "Bill paid_at should not change"
  end

  test "should set paid_at to nil if paid is false" do
    bill = Bill.new paid: false

    assert_equal bill.paid_at, nil, "Bill paid_at should be nil"
  end

  test "should be late if due_at is before today" do
    bill = Bill.new due_at: Date.today - 3.days

    assert bill.late?, "Bill should be late"
  end

  test "should not be late if is paid" do
    bill = Bill.new due_at: Date.today - 3.days, paid: true

    assert_not bill.late?, "Bill should not be late"
  end
end
