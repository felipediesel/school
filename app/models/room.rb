class Room < ApplicationRecord
  include SetPosition
  include CanDestroy

  has_many :classroom_schedules

  validates :name, presence: true
end
