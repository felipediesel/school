class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :comment
      t.integer :position, default: 0, null: false

      t.timestamps null: false
    end
  end
end
