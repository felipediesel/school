class Classroom < ApplicationRecord
  include TimeFormatter

  belongs_to :modality

  has_many :schedules, -> { order(:week_day, :start_at) }, class_name: 'ClassroomSchedule'
  has_many :subscriptions

  validates :title, presence: true
  validates :modality, presence: true
  validates :duration, presence: true

  mattr_accessor :duration_in_hours

  time_format :start_at, :duration_in_hours

  accepts_nested_attributes_for :schedules, allow_destroy: true

  def name
    "#{modality.name} #{title}"
  end

  def duration_in_hours
    duration.to_f / 3600
  end

  def duration_in_hours=(value)
    self.duration = value.to_f * 3600
  end
end
