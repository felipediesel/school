class StudentReportsController < ApplicationController
  def new

  end

  def create
    @students = Student.includes(classrooms: :modality, plans: :plan).report student_report_params

    respond_to do |format|
      format.pdf do
        kit = PDFKit.new render_to_string
        kit.stylesheets << Rails.root.join('vendor', 'assets', 'stylesheets', 'bootstrap.css')
        kit.stylesheets << Rails.root.join('app', 'assets', 'stylesheets', 'pdf.css')
        send_data kit.to_pdf, disposition: 'inline', filename: t('.filename')
      end
    end
  end

  private
    def student_report_params
      params[:student_report].blank? ? {} : params.require(:student_report).permit(:classroom_id, :status, plan_ids: [])
    end
end
