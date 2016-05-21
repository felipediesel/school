class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.references :student, index: true
      t.date :reference
      t.string :description
      t.decimal :amount, precision: 13, scale: 2, default: 0, null: false
      t.decimal :discount, precision: 13, scale: 2, default: 0, null: false
      t.decimal :total, precision: 13, scale: 2, default: 0, null: false
      t.date :due_at
      t.date :paid_at

      t.timestamps

      t.foreign_key :people, column: :student_id
    end
  end
end
