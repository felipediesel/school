class StudentReportsController < ApplicationController
  def new

  end

  def create
    @students = Student.includes(classrooms: :modality, plans: :plan).report student_report_params


    respond_to do |format|
      format.pdf do
        kit = PDFKit.new render_to_string
        kit.stylesheets << Rails.root.join('node_modules', 'bootstrap', 'dist', 'css', 'bootstrap.css')
        kit.stylesheets << Rails.root.join('app', 'javascript', 'packs', 'pdf.css')
        send_data kit.to_pdf, disposition: 'inline', filename: t('.filename')
      end
    end
  end

  private
    def student_report_params
      if params[:student_report].blank?
        {}
      else
        permited_params = params.require(:student_report).permit(:classroom_id, :status, plan_ids: [])
        permited_params[:plan_ids].reject!(&:empty?) if permited_params[:plan_ids]
        permited_params
      end
    end
end
