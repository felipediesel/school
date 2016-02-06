json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :comment, :position
  json.url room_url(room, format: :json)
end
