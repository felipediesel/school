class Modality < ApplicationRecord
  has_many :levels
  has_many :classrooms

  validates :name, presence: true

  accepts_nested_attributes_for :levels, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
end
