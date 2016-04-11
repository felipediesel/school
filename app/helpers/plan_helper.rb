module PlanHelper
  def plan_collection_by_student_plan(student_plan)
    ids = student_plan.student.plans.joins(:plan).pluck("plans.id") - [student_plan.plan.try(:id)]

    Plan.where.not(id: ids).order(:position).collect do |plan|
      ["#{plan.name} - #{number_to_currency plan.amount}", plan.id]
    end
  end
end
