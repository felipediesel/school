class StudentPlan < ApplicationRecord
  include DecimalFormatter

  belongs_to :student
  belongs_to :plan

  delegate :name, :amount, to: :plan

  decimal_format :discount

  def total_amount
    amount - amount * discount / 100
  end
end
