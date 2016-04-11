class Plan < ApplicationRecord
  include SetPosition
  include CanDestroy

  has_many :student_plans

  validates :name, presence: true
  validates :amount, presence: true
end
