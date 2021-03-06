class BillGeneratorsController < ApplicationController
  before_action :set_student

  def new
    render layout: 'modal'
  end

  def create
    students = [ @student ] if @student
    reference_date = Date.parse(params[:bill_generator][:reference])
    bill_generator_service = BillGeneratorService.new(reference_date, students)

    if bill_generator_service.call
      redirect_to [@student, :bills], notice: t('.notice', count: bill_generator_service.created_bills)
    elsif bill_generator_service.students.empty?
      redirect_to [@student, :bills], notice: t('.notice_empty')
    else
      redirect_to [@student, :bills], alert: t('.notice_error')
    end
  end

  private
    def set_student
      @student = Student.find_by_id(params[:student_id])
    end
end
