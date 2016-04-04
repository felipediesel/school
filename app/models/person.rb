class Person < ApplicationRecord
  STATUSES = %w(active suspended inactive)

  validates :name, presence: true
  validates :code, uniqueness: true, allow_blank: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  def human_status
    self.class.human_status status
  end

  def self.human_status(status_name, options = {})
    options[:scope] ||= [:activerecord, :attributes, :person, :statuses]
    options[:count] ||= 1
    I18n.t status_name, options
  end
end
