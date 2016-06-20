json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :name, :total_items, :total_cost, :avg_cost
  json.url catalog_url(catalog, format: :json)
end
