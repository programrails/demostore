json.extract! product, :id, :title, :description, :category_id, :price, :salescount, :created_at, :updated_at
json.url product_url(product, format: :json)
