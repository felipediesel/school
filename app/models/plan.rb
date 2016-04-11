class Plan < ApplicationRecord
  include SetPosition
  include CanDestroy

  validates :name, presence: true
  validates :amount, presence: true
end
