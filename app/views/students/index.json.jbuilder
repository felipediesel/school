json.array!(@students) do |student|
  json.extract! student, :id, :code, :name, :document1, :document2, :birthday, :responsible_name, :responsible_document, :street, :district, :city, :state, :country, :zip, :phone, :cellphone, :email, :blood_type, :profession, :comment
  json.url student_url(student, format: :json)
end
