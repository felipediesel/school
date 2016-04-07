require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "should have classroom_schedules" do
    assert Room.reflect_on_association(:classroom_schedules).macro == :has_many, "Room should has many classroom_schedules"
  end

  test "should have required validators" do
    room = Room.new
    assert_not room.valid?
    assert_equal [:name], room.errors.keys
  end

  # concerns/set_position test.
  # TODO: Place it in a separate test class
  test "should set position" do
    room = Room.create name: 'Main'
    assert_not_nil room.position, "Position should have a position bigger than zero"
  end

  test "should have ordered position" do
    room1 = Room.create name: 'Main'
    room2 = Room.create name: 'Secondary'

    assert_equal room1.position.succ, room2.position, "Position should be next in line"
  end

end
