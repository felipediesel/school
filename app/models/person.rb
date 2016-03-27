class Person < ApplicationRecord
  STATUSES = %w(active suspended inactive)

  validates :name, presence: true
  validates :code, uniqueness: true, allow_blank: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  def human_status
    I18n.t status, scope: [:activerecord, :attributes, :person, :statuses]
  end
end
