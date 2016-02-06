class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :code
      t.string :name
      t.string :document1
      t.string :document2
      t.date :birthday
      t.string :responsible_name
      t.string :responsible_document
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
      t.string :profession
      t.text :comment

      t.timestamps null: false
    end
  end
end
