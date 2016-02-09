class Classroom < ActiveRecord::Base
  include TimeFormatter

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

  mattr_accessor :duration_in_hours

  time_format :start_at, :duration_in_hours

  def duration_in_hours
    duration.to_f / 3600
  end

  def duration_in_hours=(value)
    self.duration = value.to_f * 3600
  end
end
