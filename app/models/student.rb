class Student < Person
  has_many :subscriptions
  has_many :classrooms, through: :subscriptions
  has_many :levels, class_name: 'StudentLevel'

  default_scope { where(student: true) }

  validates :responsible_name, presence: true, if: :under_18?

  before_save :empty_responsible_name_if_is_over_18

  def under_18?
    birthday.present? and birthday > lambda { 18.years.ago }.call
  end

  private

  def empty_responsible_name_if_is_over_18
    if ! under_18?
      self.responsible_name = nil
      self.responsible_document = nil
    end
  end

end
