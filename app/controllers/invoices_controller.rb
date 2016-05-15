class InvoicesController < ApplicationController
  before_action :set_student

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    @invoice_options = invoice_params

    respond_to do |format|
      format.pdf do
        kit = PDFKit.new render_to_string
        kit.stylesheets << Rails.root.join('vendor', 'assets', 'stylesheets', 'bootstrap.css')
        kit.stylesheets << Rails.root.join('app', 'assets', 'stylesheets', 'invoice.css')
        send_data kit.to_pdf, disposition: 'inline', filename: t('.filename', student: @student.name.parameterize(separator: '_'))
      end
    end

  end

  private

    def set_student
      @student = Student.find(params[:student_id])
    end

    def invoice_params
      invoice_options = params.require(:invoice).permit(:first_month, :months, :comment)
      invoice_options[:first_month] = begin
        Date.parse(invoice_options[:first_month])
      rescue ArgumentError
        Date.today
      end
      invoice_options[:first_month] = invoice_options[:first_month].beginning_of_month

      invoice_options[:months] = invoice_options[:months].to_i || 6

      invoice_options
    end
end
