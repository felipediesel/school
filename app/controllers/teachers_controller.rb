class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @status = params.fetch(:status, 'active')
    redirect :teachers if !Teacher::STATUSES.include? @status

    @teachers = Teacher.where(status: @status).includes(classrooms: :modality).order(:name)
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    teacher_respond @teacher.save, :new
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    teacher_respond @teacher.update(teacher_params), :edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:code, :name, :document1, :document2, :birthday, :status, :street, :district, :city, :state, :country, :zip, :phone, :cellphone, :email, :blood_type, :comment)
    end

    def teacher_respond(saved, error_view = :edit)
      respond_to do |format|
        if saved
          format.html { redirect_to @teacher, notice: t('.notice', name: @teacher.name) }
          format.json { render :show, status: :ok, location: @teacher }
        else
          format.html { render error_view }
          format.json { render json: @teacher.errors, status: :unprocessable_entity }
        end
      end
    end
end
