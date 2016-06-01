class AddTotalAmountToStudentPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :student_plans, :total_amount, :decimal, precision: 13, scale: 2, default: 0, after: :discount
  end
end
