class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :classroom
  belongs_to :schedule, class_name: 'ClassroomSchedule'

  delegate :modality, to: :classroom, allow_nil: true
end
