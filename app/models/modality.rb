class Modality < ApplicationRecord
  has_many :levels, dependent: :destroy
  has_many :classrooms
  has_many :student_levels

  validates :name, presence: true

  accepts_nested_attributes_for :levels, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }

  before_destroy :check_if_can_be_destroyed

  def can_destroy?
    classrooms.empty? and student_levels.empty?
  end

  private
    def check_if_can_be_destroyed
      throw(:abort) if !can_destroy?
    end
end
