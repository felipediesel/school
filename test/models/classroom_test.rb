require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  test "should belongs to modality" do
    assert Classroom.reflect_on_association(:modality).macro == :belongs_to, "Classroom should belongs to modality"
  end

  test "should belongs to teacher" do
    assert Classroom.reflect_on_association(:teacher).macro == :belongs_to, "Classroom should belongs to teacher"
  end

  test "should belongs to room" do
    assert Classroom.reflect_on_association(:room).macro == :belongs_to, "Classroom should belongs to room"
  end

  test "should have subscriptions" do
    assert Classroom.reflect_on_association(:subscriptions).macro == :has_many, "Classroom should has many subscriptions"
  end

  test "should have required validators" do
    classroom = Classroom.new start_at: nil, duration: nil
    assert_not classroom.valid?
    assert_equal [:name, :modality, :teacher, :room, :day_of_week, :start_at, :duration], classroom.errors.keys
  end
end
