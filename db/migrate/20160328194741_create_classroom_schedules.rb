class CreateClassroomSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :classroom_schedules do |t|
      t.references :classroom, foreign_key: true
      t.references :teacher, index: true
      t.references :room, foreign_key: true
      t.integer :week_day, default: 1
      t.decimal :start_at, default: 19

      t.timestamps
    end

    add_foreign_key :classrooms, :people, column: :teacher_id
  end
end
