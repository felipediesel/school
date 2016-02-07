class Classroom < ActiveRecord::Base
  belongs_to :modality
  belongs_to :teacher
  belongs_to :room
  has_many :subscriptions

  validates :name, presence: true
  validates :modality, presence: true
  validates :teacher, presence: true
  validates :room, presence: true
  validates :day_of_week, presence: true
  validates :start_at, presence: true
  validates :duration, presence: true
end
