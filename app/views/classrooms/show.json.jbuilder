json.extract! @classroom, :id, :title, :modality_id, :duration, :personal, :comment, :created_at, :updated_at
json.schedules @classroom.schedules, :teacher_id, :room_id, :week_day, :start_at, :created_at, :updated_at

