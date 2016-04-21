class SubscriptionsController < ApplicationController
  before_action :set_student
  before_action :set_subscription, only: [:show, :update, :destroy]

  # GET /students/1/subscriptions
  # GET /students/1/subscriptions.json
  def index
    @subscriptions = @student.subscriptions.joins(classroom: :modality).joins(:schedule).order('classroom_schedules.week_day', 'classroom_schedules.start_at')
  end

  # GET /students/1/subscriptions/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # POST /students/1/subscriptions.json
  def create
    @subscription = @student.subscriptions.new(subscription_params)

    respond_to do |format|
      format.json do
        if @subscription.save
          render :show, status: :ok, location: [@student, @subscription]
        else
          render json: @subscription.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /students/1/subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end

    def set_subscription
      @subscription = @student.subscriptions.find(params[:id])
    end

    def subscription_params
      params.require(:subscription).permit(:classroom_id, :schedule_id)
    end
end
