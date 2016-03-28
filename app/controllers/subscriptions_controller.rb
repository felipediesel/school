class SubscriptionsController < ApplicationController
  before_action :set_student
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /students/1/subscriptions
  # GET /students/1/subscriptions.json
  def index
    @subscriptions = @student.subscriptions.joins(classroom: :modality).order('modalities.name', 'classrooms.name', 'classrooms.day_of_week', 'classrooms.start_at')
    respond_to do |format|
      format.html do
         @subscriptions = @subscriptions.group_by { |l| l.classroom.modality }
      end
      format.json
    end
  end

  # GET /students/1/subscriptions/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # GET /students/1/subscriptions/new
  def new
    @subscription = @student.subscriptions.new
  end

  # GET /students/1/subscriptions/1/edit
  def edit
  end

  # POST /students/1/subscriptions
  # POST /students/1/subscriptions.json
  def create
    @subscription = @student.subscriptions.new(subscription_params)

    subscription_respond @subscription.save, :new
  end

  # PATCH/PUT /students/1/subscriptions/1
  # PATCH/PUT /students/1/subscriptions/1.json
  def update
    subscription_respond @subscription.update(subscription_params), :edit
  end

  # DELETE /students/1/subscriptions/1
  # DELETE /students/1/subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to [@student, :subscriptions], notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = @student.subscriptions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:classroom_id)
    end

    def subscription_respond(saved, error_view = :edit)
      respond_to do |format|
        if saved
          format.html { redirect_to [@student, :subscriptions], notice: t('.notice') }
          format.json { render :show, status: :ok, location: @subscription }
        else
          format.html { render error_view }
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
        end
      end
    end
end
