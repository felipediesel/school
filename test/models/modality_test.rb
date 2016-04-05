require 'test_helper'

class ModalityTest < ActiveSupport::TestCase
  test "should have levels" do
    assert Modality.reflect_on_association(:levels).macro == :has_many, "Modality should has many levels"
  end

  test "should have classrooms" do
    assert Modality.reflect_on_association(:classrooms).macro == :has_many, "Modality should has many classrooms"
  end

  test "should have student_levels" do
    assert Modality.reflect_on_association(:student_levels).macro == :has_many, "Modality should has many student_levels"
  end

  test "should have required validators" do
    modality = Modality.new
    assert_not modality.valid?
    assert_equal [:name], modality.errors.keys
  end

  test "should allow destroy if do not have any foreign key" do
    modality = modalities(:fk_free)
    modality.destroy
    assert modality.destroyed?, "Modality should be destroyed."
  end

  test "should not allow destroy if do have any foreign key" do
    modality = modalities(:jiujitsu)
    modality.destroy
    assert_not modality.destroyed?, "Modality should not allow to be destroyed."
  end
end
