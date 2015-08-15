json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :email_address
  json.url user_url(user, format: :json)
end
