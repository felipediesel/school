class StudentLevelsController < ApplicationController
  before_action :set_student
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    @levels = @student.levels.joins(:modality).order('modalities.name', date: :desc).group_by { |l| l.modality }
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
  end

  # GET /levels/new
  def new
    @level = StudentLevel.new
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = StudentLevel.new(level_params)

    student_level_respond @level.save, :new
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    student_level_respond @level.update(level_params), :edit
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to levels_url, notice: t('.notice', name: @level.name) }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = @student.levels.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.require(:level).permit(:modality, :level, :date)
    end

    def student_level_respond(saved, error_view = :edit)
      respond_to do |format|
        if saved
          format.html { redirect_to :levels, notice: t('.notice') }
          format.json { render :show, status: :ok, location: @level }
        else
          format.html { render error_view }
          format.json { render json: @level.errors, status: :unprocessable_entity }
        end
      end
    end
end
