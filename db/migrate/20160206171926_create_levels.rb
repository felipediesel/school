class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.references :modality, index: true, foreign_key: true
      t.string :name
      t.string :color, default: '#FFFFFF'
      t.integer :position, default: 0, null: false

      t.timestamps null: false
    end
  end
end
