class Modality < ApplicationRecord
  include CanDestroy

  has_many :levels, -> { order(:position) }, dependent: :destroy
  has_many :classrooms
  has_many :student_levels

  validates :name, presence: true

  accepts_nested_attributes_for :levels, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

  before_destroy :check_if_can_be_destroyed

  self.can_destroy_associations = [:classrooms, :student_levels]
end
