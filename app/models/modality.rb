class Modality < ApplicationRecord
  has_many :levels
  has_many :classrooms

  validates :name, presence: true

  accepts_nested_attributes_for :levels, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
end
