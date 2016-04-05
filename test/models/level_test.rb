require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  test "should belongs to modality" do
    assert Level.reflect_on_association(:modality).macro == :belongs_to, "Level should belongs to modality"
  end

  test "should have required validators" do
    level = Level.new
    assert_not level.valid?
    assert_includes level.errors.keys, :name, "Name presence is required"
  end

  test "should set position" do
    level = Level.create name: 'Main'
    assert_not_nil level.position, "Position should have a position bigger than zero"
  end

  test "should allow destroy if do not have any student_levels" do
    level = levels(:fk_free_1)
    level.destroy
    assert level.destroyed?, "Level should be destroyed."
  end

  test "should not allow destroy if do have any student_levels" do
    level = levels(:jiujitsu_white)
    level.destroy
    assert_not level.destroyed?, "Level should not allow to be destroyed."
  end
end
