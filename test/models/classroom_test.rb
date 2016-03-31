require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  test "should belongs to modality" do
    assert Classroom.reflect_on_association(:modality).macro == :belongs_to, "Classroom should belongs to modality"
  end

  test "should have subscriptions" do
    assert Classroom.reflect_on_association(:subscriptions).macro == :has_many, "Classroom should has many subscriptions"
  end

  test "should have schedules" do
    assert Classroom.reflect_on_association(:schedules).macro == :has_many, "Classroom should has many schedules"
  end

  test "should have required validators" do
    classroom = Classroom.new duration: nil
    assert_not classroom.valid?
    assert_equal [ :title, :modality, :duration ], classroom.errors.keys
  end

  test "should convert duration_in_hours to duration" do
    classroom_schedule = Classroom.new
    {
      2 => 7200,
      '2' => 7200,
      0.5 => 1800,
      15.2 => 54_720
    }.each do |value_in_hours, value|
      classroom_schedule.duration_in_hours = value_in_hours
      assert_equal classroom_schedule.duration, value, "#{value_in_hours} hours should be converted to #{value} seconds"
    end
  end

  test "should convert duration to duration_in_hours" do
    classroom_schedule = Classroom.new
    {
      7200 => 2,
      1800 => 0.5,
      54_720 => 15.2
    }.each do |value, value_in_hours|
      classroom_schedule.duration = value
      assert_equal classroom_schedule.duration_in_hours, value_in_hours, "#{value} seconds should be converted to #{value_in_hours} hours"
    end
  end
end
