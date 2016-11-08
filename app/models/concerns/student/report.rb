class Student < Person
  module Report
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def report(params = {})
        students = self

        students = students.joins(:subscriptions).where(subscriptions: { classroom_id: params[:classroom_id] }) if params[:classroom_id].present?
        students = students.joins(:plans).where(student_plans: { plan_id: params[:plan_id] }) if params[:plan_id].present?
        students = students.where(status: params[:status]) if params[:status].present?

        students.distinct.order :name
      end
    end

  end
end
