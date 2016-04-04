class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  # GET /students
  # GET /students.json
  def index
    @status = params.fetch(:status, 'active')
    redirect :students if !Student::STATUSES.include? @status

    @students = Student.where(status: @status).includes(classrooms: :modality).order(:name)
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    student_respond @student.save, :new
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    student_respond @student.update(student_params), :edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:code, :name, :document1, :document2, :birthday, :status, :responsible_name, :responsible_document, :street, :district, :city, :state, :country, :zip, :phone, :cellphone, :email, :blood_type, :profession, :comment)
    end

    def student_respond(saved, error_view = :edit)
      respond_to do |format|
        if saved
          format.html { redirect_to :students, notice: t('.notice', name: @student.name) }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render error_view }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
end
