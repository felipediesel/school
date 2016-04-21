class StudentPlan < ApplicationRecord
  belongs_to :student
  belongs_to :plan

  delegate :name, :amount, to: :plan
end
