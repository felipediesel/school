class ClassroomSchedule < ApplicationRecord
  include TimeFormatter

  belongs_to :classroom
  belongs_to :teacher
  belongs_to :room

  has_many :subscriptions

  validates :teacher_id, presence: true
  validates :room_id, presence: true
  validates :week_day, presence: true
  validates :start_at, presence: true

  time_format :start_at

  def abbr_week_day_with_start_at
    "#{I18n.t("date.abbr_day_names")[week_day]} #{I18n.t 'text.at'} #{start_at_formatted}"
  end
end
