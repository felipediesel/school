class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :classroom

  delegate :modality, to: :classroom, allow_nil: true

  validates :student, presence: true
  validates :classroom, presence: true
end
