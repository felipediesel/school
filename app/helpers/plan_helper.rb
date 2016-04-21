module PlanHelper
  def plan_collection
    Plan.order(:position).collect do |plan|
      ["#{plan.name} - #{number_to_currency plan.amount}", plan.id]
    end
  end
end
