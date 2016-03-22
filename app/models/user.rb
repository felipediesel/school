class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  def remember_me
    (super == nil) ? '1' : super
  end
end
