class StudentLevelsController < ApplicationController
  before_action :set_student
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /students/1/levels
  # GET /students/1/levels.json
  def index
    @student_levels = @student.levels.joins(:modality).order('modalities.name', date: :desc)

    respond_to do |format|
      format.html do
        @modalities = Modality.where.not(id: @student_levels.pluck(:modality_id)).order('modalities.name')
        @student_levels = @student_levels.group_by { |l| l.modality }
      end
      format.json
    end
  end

  # GET /students/1/levels/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # GET /students/1/levels/new
  def new
    @student_level = @student.levels.new modality_id: params[:modality_id]
  end

  # GET /students/1/levels/1/edit
  def edit
  end

  # POST /students/1/levels
  # POST /students/1/levels.json
  def create
    @student_level = @student.levels.new(student_level_params)

    student_level_respond @student_level.save, :new
  end

  # PATCH/PUT /students/1/levels/1
  # PATCH/PUT /students/1/levels/1.json
  def update
    student_level_respond @student_level.update(student_level_params), :edit
  end

  # DELETE /students/1/levels/1
  # DELETE /students/1/levels/1.json
  def destroy
    @student_level.destroy
    respond_to do |format|
      format.html { redirect_to [@student, :student_levels], notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @student_level = @student.levels.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_level_params
      params.require(:student_level).permit(:modality_id, :level_id, :date)
    end

    def student_level_respond(saved, error_view = :edit)
      respond_to do |format|
        if saved
          format.html { redirect_to [@student, :student_levels], notice: t('.notice') }
          format.json { render :show, status: :ok, location: @student_level }
        else
          format.html { render error_view }
          format.json { render json: @student_level.errors, status: :unprocessable_entity }
        end
      end
    end
end
