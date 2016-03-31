class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :student, index: true
      t.references :classroom, foreign_key: true
      t.references :schedule, index: true

      t.timestamps null: false
    end
    add_foreign_key :subscriptions, :people, column: :student_id
    add_foreign_key :subscriptions, :classroom_schedules, column: :schedule_id
  end
end
