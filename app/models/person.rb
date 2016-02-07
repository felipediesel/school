class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :code, uniqueness: true, allow_blank: true
end
