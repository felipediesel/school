require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test "should have classroom" do
    assert Teacher.reflect_on_association(:classrooms).macro == :has_many, "Teacher should has many classrooms"
  end

  test "should not have responsible" do
    teacher = Teacher.create name: 'Paul', responsible_name: 'John', responsible_document: '1234567890'

    assert teacher.valid?

    assert_nil teacher.responsible_name, "Responsible name is not allowed"
    assert_nil teacher.responsible_document, "Responsible document is not allowed"
  end
end
