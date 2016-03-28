json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :classroom_id
  json.url student_subscription_url(@student, subscription, format: :json)
end
