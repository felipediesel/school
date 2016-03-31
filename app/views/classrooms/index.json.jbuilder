json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :name, :modality_id, :teacher_id, :room_id, :week_day, :start_at, :duration, :personal, :comment
  json.url classroom_url(classroom, format: :json)
end
