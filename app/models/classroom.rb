class Classroom < ActiveRecord::Base
  belongs_to :modality
  belongs_to :teacher
  belongs_to :room
end
