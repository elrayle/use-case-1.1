json.array!(@virtual_collections) do |virtual_collection|
  json.extract! virtual_collection, :id
  json.url virtual_collection_url(virtual_collection, format: :json)
end
