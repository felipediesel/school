require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "should have required validators" do
    person = Person.new
    assert_not person.valid?
    assert_equal [:name], person.errors.keys
  end

  test "should have uniq code" do
    person = Person.create code: '1', name: 'John'
    assert person.valid?

    person2 = Person.new code: '1'

    assert_not person2.valid?
    assert_includes person2.errors.keys, :code, "Code should be uniq"
  end
end
