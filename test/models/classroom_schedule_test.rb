require 'test_helper'

class ClassroomScheduleTest < ActiveSupport::TestCase
  test "should belongs to classroom_schedule" do
    assert ClassroomSchedule.reflect_on_association(:classroom).macro == :belongs_to, "ClassroomSchedule should belongs to classroom"
  end

  test "should belongs to teacher" do
    assert ClassroomSchedule.reflect_on_association(:teacher).macro == :belongs_to, "ClassroomSchedule should belongs to teacher"
  end

  test "should belongs to room" do
    assert ClassroomSchedule.reflect_on_association(:room).macro == :belongs_to, "ClassroomSchedule should belongs to room"
  end

  test "should have subscriptions" do
    assert ClassroomSchedule.reflect_on_association(:subscriptions).macro == :has_many, "ClassroomSchedule should has many subscriptions"
  end

  test "should have required validators" do
    classroom_schedule = ClassroomSchedule.new start_at: nil, week_day: nil
    assert_not classroom_schedule.valid?
    assert_equal [:teacher, :room, :week_day, :start_at], classroom_schedule.errors.keys
  end

  test "should convert start_at_formatted" do # it should be tested outside of here using Mock
    classroom_schedule = ClassroomSchedule.new
    {
      '1:30' => 1.5,
      '01:30' => 1.5,
      '01:03' => 1.05,
      '1:3' => 1.05,
      '1h30' => 1.5,
      '01h30' => 1.5,
      '11:12' => 11.2,
      '11h12' => 11.2,
      '11h6' => 11.1,
      '11h' => 11.0,
      '11' => 11.0,
      '11 h' => 11.0,
      '30m' => 0.5,
      '30 m' => 0.5,
      'TEXT' => 0
    }.each do |value_formatted, value|
      classroom_schedule.start_at_formatted = value_formatted
      assert_equal classroom_schedule.start_at, value, "#{value_formatted} should be converted to #{value}"
    end
  end

  test "should return formatted start_at" do # it should be tested outside of here using Mock
    classroom_schedule = ClassroomSchedule.new
    {
      1.5 => '1:30',
      1.05 => '1:03',
      0.5 => '0:30',
      11.2 => '11:12',
      120.2 => '120:12'
    }.each do |value, value_formatted|
      classroom_schedule.start_at = value
      assert_equal classroom_schedule.start_at_formatted, value_formatted, "#{value} should be formatted as #{value_formatted}"
    end
  end
end
