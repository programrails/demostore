json.array!(@categories) do |category|
  json.extract! category, :title, :discount
  json.url category_url(category, format: :json)
end