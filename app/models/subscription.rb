class Subscription < ActiveRecord::Base
  belongs_to :student
  belongs_to :classroom

  validates :student, presence: true
  validates :classroom, presence: true
end
