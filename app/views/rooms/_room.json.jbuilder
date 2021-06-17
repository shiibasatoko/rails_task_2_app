json.extract! room, :id, :user_id, :title, :body, :fee, :address, :image_id, :created_at, :updated_at
json.url room_url(room, format: :json)
