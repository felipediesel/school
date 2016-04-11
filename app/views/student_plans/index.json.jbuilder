json.array!(@student_plans) do |student_plan|
  json.extract! student_plan, :id, :plan_id, :discount
  json.url student_student_plan_url(@student, student_plan, format: :json)
end
