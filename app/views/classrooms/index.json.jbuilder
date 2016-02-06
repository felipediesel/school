json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :name, :modality_id, :teacher_id, :room_id, :day_of_week, :start_at, :duration, :personal, :comment
  json.url classroom_url(classroom, format: :json)
end
