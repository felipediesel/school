class Option < ApplicationRecord
  AVAILABLE = %w( app_name navbar_background invoice_comment invoice_day )

  validates :name, presence: true, uniqueness: true, inclusion: { in: AVAILABLE }

  def self.set(name, value = nil)
    option = find_or_initialize_by name: name
    option.value = value
    option.save
  end

  def self.get(name, default = nil)
    as_hash[name] || default
  end

  def self.as_hash # It would be good to use cache here
    options = Option.all.pluck :name, :value
    ActiveSupport::HashWithIndifferentAccess[options]
  end
end
