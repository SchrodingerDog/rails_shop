json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :catalog_number, :description
  json.url product_url(product, format: :json)
end
