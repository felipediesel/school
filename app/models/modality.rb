class Modality < ActiveRecord::Base
  has_many :levels
  has_many :classrooms

  validates :name, presence: true
end
