class Student < ActiveRecord::Base
  has_many :subscriptions
end
