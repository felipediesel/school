json.array!(@bills) do |bill|
  json.extract! bill, :id, :student_id, :description, :amount, :discount, :paid_at
  json.url bill_url(bill, format: :json)
end
