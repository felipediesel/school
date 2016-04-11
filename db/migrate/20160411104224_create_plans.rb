class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :amount, precision: 13, scale: 2, default: 0
      t.integer :position, null: false, default: 0
      t.text :comment

      t.timestamps
    end
  end
end
