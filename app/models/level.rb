class Level < ApplicationRecord
  include SetPosition
  include CanDestroy

  belongs_to :modality
  has_many :student_levels

  validates :name, presence: true
end
