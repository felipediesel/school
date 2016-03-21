class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :classroom

  validates :student, presence: true
  validates :classroom, presence: true
end
