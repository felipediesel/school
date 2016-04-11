module PlanHelper
  def plan_collection_by_student_plan(student_plan)
    ids = student_plan.student.plans.pluck(&:id) - [student_plan.id]

    Plan.where.not(id: ids).order(:position).collect do |plan|
      ["#{plan.name} - #{number_to_currency plan.amount}", plan.id]
    end
  end
end
