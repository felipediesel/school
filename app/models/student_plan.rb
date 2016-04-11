class StudentPlan < ApplicationRecord
  belongs_to :student
  belongs_to :plan

  delegate :name, :amount, to: :plan

  validates :plan_id, uniqueness: { scope: [ :student_id ] }
end
