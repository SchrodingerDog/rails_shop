json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :cat_number, :description
  json.url product_url(product, format: :json)
end
