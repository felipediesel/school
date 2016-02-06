class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :document1
      t.string :document2
      t.string :birthday
      t.string :street
      t.string :district
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :phone
      t.string :cellphone
      t.string :email
      t.string :blood_type
      t.text :comment

      t.timestamps null: false
    end
  end
end
