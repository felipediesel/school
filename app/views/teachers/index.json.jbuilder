json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :document1, :document2, :birthday, :street, :district, :city, :state, :country, :zip, :phone, :cellphone, :email, :blood_type, :comment
  json.url teacher_url(teacher, format: :json)
end
