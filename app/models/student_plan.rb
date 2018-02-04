class StudentPlan < ApplicationRecord
  include DecimalFormatter

  belongs_to :student, optional: true
  belongs_to :plan, optional: true

  delegate :name, :amount, to: :plan

  decimal_format :discount

  before_save :set_total_amount

  def total_amount
    amount - amount * discount / 100
  end

  private

    def set_total_amount
      self.total_amount = total_amount
    end
end
