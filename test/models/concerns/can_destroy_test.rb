require 'test_helper'

class CanDestroyTest < ActiveSupport::TestCase
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
