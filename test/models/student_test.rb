require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "should have subscriptions" do
    assert Student.reflect_on_association(:subscriptions).macro == :has_many, "Student should has many subscriptions"
  end

  test "should have classrooms" do
    assert Student.reflect_on_association(:classrooms).macro == :has_many, "Student should has many classrooms"
  end

  test "should have levels" do
    assert Student.reflect_on_association(:levels).macro == :has_many, "Student should has many levels"
  end

  test "should have bills" do
    assert Student.reflect_on_association(:bills).macro == :has_many, "Student should has many bills"
  end

  test "should have plans" do
    assert Student.reflect_on_association(:plans).macro == :has_many, "Student should has many plans"
  end

  test "should have responsible if is under 18" do
    student = Student.new name: 'Felipe', birthday: 17.years.ago

    assert_not student.valid?
    assert_includes student.errors.keys, :responsible_name, "Responsible name is required if is under 18."
  end

  test "should not have responsible if is over 18" do
    student = Student.create name: 'Felipe', birthday: 20.years.ago, responsible_name: 'Paul'

    assert student.responsible_name.blank?
  end

  test "should load only active students to generate bills" do
    plan = Plan.create name: "Active Student's plan", amount: 50

    active_student = Student.create name: 'Active Student', status: :active
    active_student.plans.create plan: plan
    suspended_student = Student.create name: 'Active Student', status: :suspended
    suspended_student.plans.create plan: plan
    inactive_student = Student.create name: 'Active Student', status: :inactive
    inactive_student.plans.create plan: plan

    students = Student.to_generate_bills(Date.today)

    assert_includes students, active_student, "Students should load active students"
    assert_not_includes students, suspended_student, "Students should not load suspended students"
    assert_not_includes students, inactive_student, "Students should not load inactive students"
  end

  test "should load only students that have an amount to generate bills" do
    student_ten = Student.create name: 'Ten'
    student_ten.plans.create plan: Plan.create(name: "Ten's plan", amount: 10)
    student_zero = Student.create name: 'Zero'
    student_zero.plans.create plan: Plan.create(name: "Zero's plan", amount: 0)
    student_discount = Student.create name: 'Discount'
    student_discount.plans.create plan: Plan.create(name: "Discount's plan", amount: 10), discount: 100

    students = Student.to_generate_bills(Date.today)

    assert_includes students, student_ten, "Students should load students with amount bigger then zero"
    assert_not_includes students, student_zero, "Students should not load students with amount of zero"
    assert_not_includes students, student_discount, "Students should not load student if discount is 100%"
  end
end
