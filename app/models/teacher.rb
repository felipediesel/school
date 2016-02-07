class Teacher < Person
  has_many :classrooms

  default_scope { where( teacher: true ) }

  before_save :set_responsible_nil

  private

  def set_responsible_nil
    self.responsible_name = nil
    self.responsible_document = nil
  end
end
