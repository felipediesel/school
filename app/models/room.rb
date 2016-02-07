class Room < ActiveRecord::Base
  include SetPosition

  has_many :classrooms

  validates :name, presence: true
end
