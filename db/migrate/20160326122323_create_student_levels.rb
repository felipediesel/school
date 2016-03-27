class CreateStudentLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :student_levels do |t|
      t.references :student, index: true
      t.references :modality, foreign_key: true
      t.references :level, foreign_key: true
      t.date :date

      t.timestamps
    end

    add_foreign_key :student_levels, :people, column: :student_id
  end
end
