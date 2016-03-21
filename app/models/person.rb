class Person < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true, allow_blank: true
end
