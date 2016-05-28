require 'test_helper'

class BillTest < ActiveSupport::TestCase
  setup do
    @overdue = Bill.create! description: 'Overdue', student: Student.first, due_at: 30.days.ago
    @paid = Bill.create! description: 'Overdue', student: Student.first, due_at: 30.days.ago, paid_at: 2.days.ago
    @not_paid = Bill.create! description: 'Overdue', student: Student.first, due_at: 30.days.from_now
  end

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

  test "should be overdue if due_at is before today" do
    bill = Bill.new due_at: Date.today - 3.days

    assert bill.overdue?, "Bill should be overdue"
  end

  test "should not be overdue if is paid" do
    bill = Bill.new due_at: Date.today - 3.days, paid: true

    assert_not bill.overdue?, "Bill should not be overdue"
  end

  test "should filter not paid bills" do
    bills = Bill.not_paid
    assert_includes bills, @not_paid, "Not paid bills should include a not paid one"
    assert_includes bills, @overdue, "Not paid bills should include an overdue one"
    assert_not_includes bills, @paid, "Not paid bills should not include a paid one"
  end

  test "should filter paid bills" do
    bills = Bill.paid
    assert_includes bills, @paid, "Paid bills should include a paid one"
    assert_not_includes bills, @overdue, "Paid bills should not include an overdue one"
    assert_not_includes bills, @not_paid, "Paid bills should not include a not paid one"
  end

  test "should filter overdue bills" do
    bills = Bill.overdue
    assert_includes bills, @overdue, "Overdue bills should include an overdue one"
    assert_not_includes bills, @not_paid, "Overdue bills should not include a not paid one"
    assert_not_includes bills, @paid, "Overdue bills should not include a paid one"
  end
end
