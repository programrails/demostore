json.array!(@orders) do |order|
  json.extract! order, :user_id, :pay_type
  json.url order_url(order, format: :json)
end