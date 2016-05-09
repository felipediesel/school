class Plan < ApplicationRecord
  include SetPosition
  include CanDestroy
  include DecimalFormatter

  has_many :student_plans

  validates :name, presence: true
  validates :amount, presence: true

  decimal_format :amount
end
