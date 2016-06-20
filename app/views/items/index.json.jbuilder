json.array!(@model) do |item|
  json.extract! item, :id, :name, :description, :price, :catalog_id
  json.url item_url(item, format: :json)
end
