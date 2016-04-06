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
end
