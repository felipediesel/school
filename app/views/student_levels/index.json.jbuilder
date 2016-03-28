json.array!(@student_levels) do |student_level|
  json.extract! student_level, :id, :level_id, :date
  json.url student_student_level_url(@student, student_level, format: :json)
end
