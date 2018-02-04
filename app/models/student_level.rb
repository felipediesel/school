class StudentLevel < ApplicationRecord
  belongs_to :student
  belongs_to :modality
  belongs_to :level
end
