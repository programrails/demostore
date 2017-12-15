json.array!(@products) do |product|
  json.extract! product, :title, :description, :category_id, :price, :salescount
  json.url product_url(product, format: :json)
end