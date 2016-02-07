require 'test_helper'

class ModalityTest < ActiveSupport::TestCase
  test "should have levels" do
    assert Modality.reflect_on_association(:levels).macro == :has_many, "Modality should has many levels"
  end

  test "should have classrooms" do
    assert Modality.reflect_on_association(:classrooms).macro == :has_many, "Modality should has many classrooms"
  end

  test "should have required validators" do
    modality = Modality.new
    assert_not modality.valid?
    assert_equal [:name], modality.errors.keys
  end
end
