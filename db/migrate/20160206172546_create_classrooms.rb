class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :title
      t.references :modality, index: true, foreign_key: true
      t.boolean :personal, dafult: false
      t.integer :duration, default: 3600
      t.text :comment

      t.timestamps null: false
    end
  end
end
