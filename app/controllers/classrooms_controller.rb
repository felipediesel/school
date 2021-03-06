class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    @classrooms = Classroom.joins(:modality).order('modalities.name', :title)
  end

  # GET /classrooms/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
    @classroom.schedules.build
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(classroom_params)
    respond_to do |format|
      if @classroom.save
        format.html { redirect_to classrooms_url, notice: t('.notice', name: @classroom.name) }
        format.json { render :show, status: :created, location: @classroom }
      else
        format.html { render :new }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update

    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to classrooms_url, notice: t('.notice', name: @classroom.name) }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    if @classroom.can_destroy?
      @classroom.destroy
      respond_to do |format|
        format.html { redirect_to :classrooms, notice: t('.notice', name: @classroom.name) }
        format.json { head :no_content }
      end
    else
      head :method_not_allowed
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:title, :modality_id, :personal, :comment, :duration, :duration_in_hours_formatted, schedules_attributes: [
        :id, :teacher_id, :room_id, :week_day, :start_at, :start_at_formatted, :_destroy
      ])
    end
end
