class CreateStudentPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :student_plans do |t|
      t.references :student, index: true
      t.references :plan, foreign_key: true
      t.decimal :discount, precision: 13, scale: 2, default: 0

      t.timestamps

      t.foreign_key :people, column: :student_id
    end
  end
end
