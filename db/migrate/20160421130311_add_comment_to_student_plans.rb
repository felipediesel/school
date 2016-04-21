class AddCommentToStudentPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :student_plans, :comment, :string, after: :discount
  end
end
