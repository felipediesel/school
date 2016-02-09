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

  test "should convert start_at_formatted" do # it should be tested outside of here using Mock
    classroom = Classroom.new
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
      classroom.start_at_formatted = value_formatted
      assert_equal classroom.start_at, value, "#{value_formatted} should be converted to #{value}"
    end
  end

  test "should return formatted start_at" do # it should be tested outside of here using Mock
    classroom = Classroom.new
    {
      1.5 => '1:30',
      1.05 => '1:03',
      0.5 => '0:30',
      11.2 => '11:12',
      120.2 => '120:12'
    }.each do |value, value_formatted|
      classroom.start_at = value
      assert_equal classroom.start_at_formatted, value_formatted, "#{value} should be formatted as #{value_formatted}"
    end
  end

  test "should convert duration_in_hours to duration" do
    classroom = Classroom.new
    {
      2 => 7200,
      '2' => 7200,
      0.5 => 1800,
      15.2 => 54_720
    }.each do |value_in_hours, value|
      classroom.duration_in_hours = value_in_hours
      assert_equal classroom.duration, value, "#{value_in_hours} hours should be converted to #{value} seconds"
    end
  end

  test "should convert duration to duration_in_hours" do
    classroom = Classroom.new
    {
      7200 => 2,
      1800 => 0.5,
      54_720 => 15.2
    }.each do |value, value_in_hours|
      classroom.duration = value
      assert_equal classroom.duration_in_hours, value_in_hours, "#{value} seconds should be converted to #{value_in_hours} hours"
    end
  end

end
