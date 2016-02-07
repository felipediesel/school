class Student < ActiveRecord::Base
  has_many :subscriptions
  has_many :classrooms, through: :subscriptions
end
