json.extract! item, :id, :name, :user_id, :price, :item_image, :category, :created_at, :updated_at
json.url item_url(item, format: :json)
