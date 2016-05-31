class BillGeneratorsController < ApplicationController
  before_action :set_student

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    bill_generator_service = BillGeneratorService.new(Date.parse(params[:bill_generator][:reference]), [@student])

    if bill_generator_service.call
      redirect_to [@student, :bills], notice: t('.notice', created_bills: bill_generator_service.created_bills)
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
