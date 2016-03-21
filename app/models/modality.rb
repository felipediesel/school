class Modality < ApplicationRecord
  has_many :levels
  has_many :classrooms

  validates :name, presence: true
end
