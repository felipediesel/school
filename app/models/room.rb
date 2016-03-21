class Room < ApplicationRecord
  include SetPosition

  has_many :classrooms

  validates :name, presence: true
end
