require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  test "should have required validators" do
    option = Option.new
    assert_not option.valid?
    assert_equal [ :name ], option.errors.keys
  end

  test "name should be uniq" do
    Option.create(name: 'app_name', value: 'SchoolApp')
    option = Option.new(name: 'app_name', value: 'SchoolApp 2')

    assert_not option.valid?
    assert_equal [ :name ], option.errors.keys
  end

  test "set should create option if it not exists" do
    assert_difference 'Option.count' do
      Option.set 'app_name', 'SchoolApp'
    end
  end
  test "set should update option if it exists" do
    Option.set 'app_name', 'SchoolApp'

    assert_no_difference 'Option.count' do
      Option.set 'app_name', 'SchoolApp'
    end
  end

end
