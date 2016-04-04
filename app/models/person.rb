class Person < ApplicationRecord
  STATUSES = %w(active suspended inactive)

  validates :name, presence: true
  validates :code, uniqueness: true, allow_blank: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  def human_status
    self.class.human_status status
  end

  def self.human_status(status_name)
    I18n.t status_name, scope: [:activerecord, :attributes, :person, :statuses]
  end
end
