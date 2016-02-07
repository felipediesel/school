require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "should have subscriptions" do
    assert Student.reflect_on_association(:subscriptions).macro == :has_many, "Student should has many :subscriptions"
  end

  test "should have classrooms" do
    assert Student.reflect_on_association(:classrooms).macro == :has_many, "Student should has many classrooms"
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
end
