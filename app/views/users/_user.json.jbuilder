json.extract! user, :id, :username, :password, :email, :preferences, :created_at, :updated_at
json.url user_url(user, format: :json)
