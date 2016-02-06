class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.references :modality, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.integer :day_of_week, limit: 1
      t.decimal :start_at, default: 0
      t.integer :duration, default: 3600
      t.boolean :personal, dafult: false
      t.text :comment

      t.timestamps null: false
    end
  end
end
