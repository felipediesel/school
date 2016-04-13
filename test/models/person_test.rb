require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "should have required validators" do
    person = Person.new status: nil
    assert_not person.valid?
    assert_equal person.errors.keys, [:name, :status, :teacher, :student ]
  end

  test "should have uniq code" do
    person = Person.create code: '10', name: 'John', student: true
    assert person.valid?

    person2 = Person.new code: '10', student: true

    assert_not person2.valid?
    assert_includes person2.errors.keys, :code, "Code should be uniq"
  end

  test "should translate person's status" do
    assert_equal people(:lee).human_status, "Ativo"
  end
end
