class Teacher < Person
  has_many :classroom_schedules
  has_many :classrooms, through: :classroom_schedules

  default_scope { where( teacher: true ) }

  before_save :set_responsible_nil

  private

  def set_responsible_nil
    self.responsible_name = nil
    self.responsible_document = nil
  end
end
