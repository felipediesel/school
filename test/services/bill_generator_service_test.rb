require 'test_helper'

class BillGeneratorServiceTest < ActiveSupport::TestCase
  test 'should return false if there is no students' do
    assert_no_difference 'Bill.count' do
      called_service = BillGeneratorService.new(Date.today, Student.none).call
      assert_not called_service, 'BillGeneratorService should return false if no student is provided'
    end
  end

  test "should load students if is not provided" do
    bill_generator_service = BillGeneratorService.new(Date.today)
    assert_not bill_generator_service.students.nil?, 'BillGeneratorService should load students'
  end

  test "should create one bill for each students" do
    bill_generator_service = BillGeneratorService.new(Date.today)

    assert_difference 'Bill.count', bill_generator_service.students.count do
      bill_generator_service.call
    end
  end

  test "should create a bill with the amount of student plans" do
    student = Student.create name: 'Jerry'
    student.plans.create plan: Plan.create(name: "Jerry's plan", amount: 50), discount: 10.5

    bill_generator_service = BillGeneratorService.new(Date.today)
    bill = bill_generator_service.create_bill student

    assert_equal bill.amount.to_f, student.plans.collect(&:total_amount).sum.to_f, "Bill shoud have the same value as the plans of a student"
  end
end
