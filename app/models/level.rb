class Level < ApplicationRecord
  include SetPosition

  belongs_to :modality
  has_many :student_levels

  validates :name, presence: true

  before_destroy :check_if_can_be_destroyed

  def can_destroy?
    student_levels.empty?
  end

  private
    def check_if_can_be_destroyed
      throw(:abort) if !can_destroy?
    end
end
