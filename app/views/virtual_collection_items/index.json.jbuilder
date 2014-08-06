json.array!(@virtual_collection_items) do |virtual_collection_item|
  json.extract! virtual_collection_item, :id
  json.url virtual_collection_item_url(virtual_collection_item, format: :json)
end
