class Student < Person
  has_many :subscriptions
  has_many :classrooms, through: :subscriptions
  has_many :levels, -> { order(:date) }, class_name: 'StudentLevel'
  has_many :bills, -> { order(:due_at) }
  has_many :plans, class_name: 'StudentPlan'

  default_scope { where(student: true) }

  validates :responsible_name, presence: true, if: :under_18?

  before_save :empty_responsible_name_if_is_over_18

  def under_18?
    birthday.present? and birthday > lambda { 18.years.ago }.call
  end

  def self.to_generate_bills(reference_date)
    self.where(status: :active)
      .where.not(id: Bill.where(reference: reference_date).pluck(:student_id))
      .joins(:plans).where('student_plans.total_amount > 0')
      .includes(plans: :plan)
  end

  private

  def empty_responsible_name_if_is_over_18
    if ! under_18?
      self.responsible_name = nil
      self.responsible_document = nil
    end
  end
end
