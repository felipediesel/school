class StudentPlansController < ApplicationController
  before_action :set_student
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /students/1/plans
  # GET /students/1/plans.json
  def index
    @student_plans = @student.plans.joins(:plan).order('plans.position')

    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /students/1/plans/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # GET /students/1/plans/new
  def new
    @student_plan = @student.plans.new
  end

  # GET /students/1/plans/1/edit
  def edit
  end

  # POST /students/1/plans
  # POST /students/1/plans.json
  def create
    @student_plan = @student.plans.new(student_plan_params)

    student_plan_respond @student_plan.save, :new
  end

  # PATCH/PUT /students/1/plans/1
  # PATCH/PUT /students/1/plans/1.json
  def update
    student_plan_respond @student_plan.update(student_plan_params), :edit
  end

  # DELETE /students/1/plans/1
  # DELETE /students/1/plans/1.json
  def destroy
    @student_plan.destroy
    respond_to do |format|
      format.html { redirect_to [@student, :student_plans], notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @student_plan = @student.plans.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_plan_params
      params.require(:student_plan).permit(:plan_id, :discount, :comment)
    end

    def student_plan_respond(saved, error_view = :edit)
      respond_to do |format|
        if saved
          format.html { redirect_to [@student, :student_plans], notice: t('.notice') }
          format.json { render :show, status: :ok, location: @student_plan }
        else
          format.html { render error_view }
          format.json { render json: @student_plan.errors, status: :unprocessable_entity }
        end
      end
    end
end
