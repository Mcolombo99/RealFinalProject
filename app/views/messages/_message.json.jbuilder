json.extract! message, :id, :body, :chatroom_id, :created_at, :updated_at
json.url message_url(message, format: :json)
