class StudentLevel < ApplicationRecord
  belongs_to :student
  belongs_to :modality
  belongs_to :level

  validates :student_id, presence: true
  validates :modality_id, presence: true
  validates :level_id, presence: true
end
