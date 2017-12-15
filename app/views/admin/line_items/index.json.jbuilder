json.array!(@line_items) do |line_item|
  json.extract! line_item, :cart_id, :order_id, :product_id, :quantity
  json.url line_item_url(line_item, format: :json)
end