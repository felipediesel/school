class SubscriptionBulkUpdatesController < ApplicationController
  before_action :set_student

  def new
    @schedules = ClassroomSchedule.joins(classroom: :modality).order('modalities.name', 'classrooms.title')

    @subscription_schedules = @student.subscriptions.collect(&:schedule)
  end

  def create
    ids = params[:subscription_bulk_updates]

    Subscription.transaction do
      @subscription_schedules = @student.subscriptions.where.not(schedule_id: ids).destroy_all

      ClassroomSchedule.where(id: ids).where.not(id: @student.subscriptions.pluck(:schedule_id)).each do |schedule|
        @student.subscriptions.create(schedule_id: schedule.id, classroom_id: schedule.classroom_id)
      end
    end

    redirect_to [@student, :subscriptions], notice: t('.notice')
  end

  private
    def set_student
      @student = Student.find(params[:student_id])
    end
end
