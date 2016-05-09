require 'test_helper'

class DecimalFormatterTest < ActiveSupport::TestCase
  test "should convert amount_formatted" do
    plan = Plan.new
    {
      '1,50' => 1.5,
      '01,50' => 1.5,
      '1,05' => 1.05,
      '1.05' => 105,
      '12345,6789' => 12_345.68,
      '11.22' => 1_122,
      '11,15TEXT' => 11.15,
      'TEXT' => 0
    }.each do |value_formatted, value|
      plan.amount_formatted = value_formatted
      assert_equal plan.amount.to_f, value, "#{value_formatted} should be converted to #{value}"
    end
  end

  test "should return formatted amount" do
    plan = Plan.new
    {
      1.5 => '1,50',
      1.05 => '1,05',
      0.5 => '0,50',
      12_345.67 => '12.345,67',
      12_345.678 => '12.345,68'
    }.each do |value, value_formatted|
      plan.amount = value
      assert_equal plan.amount_formatted, value_formatted, "#{value} should be formatted as #{value_formatted}"
    end
  end
end
