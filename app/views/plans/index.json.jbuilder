json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :amount, :comment, :position
  json.url plan_url(plan, format: :json)
end
