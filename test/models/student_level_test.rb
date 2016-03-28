require 'test_helper'

class StudentLevelTest < ActiveSupport::TestCase
  test "should belongs to student" do
    assert StudentLevel.reflect_on_association(:student).macro == :belongs_to, "StudentLevel should belongs to student"
  end

  test "should belongs to modality" do
    assert StudentLevel.reflect_on_association(:modality).macro == :belongs_to, "StudentLevel should belongs to modality"
  end

  test "should belongs to level" do
    assert StudentLevel.reflect_on_association(:level).macro == :belongs_to, "StudentLevel should belongs to level"
  end

  test "should have required validators" do
    student_level = StudentLevel.new
    assert_not student_level.valid?
    assert_equal [:student_id, :modality_id, :level_id], student_level.errors.keys
  end
end
