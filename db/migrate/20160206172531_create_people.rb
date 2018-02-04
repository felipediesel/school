class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :code
      t.boolean :student, default: false
      t.boolean :teacher, default: false
      t.string :name
      t.string :document1
      t.string :document2
      t.date :birthday
      t.string :status, index: true, default: 'active'
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
