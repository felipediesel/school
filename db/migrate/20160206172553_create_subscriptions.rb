class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :student, index: true, foreign_key: true
      t.references :classroom, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
