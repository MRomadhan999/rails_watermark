json.extract! user, :id, :nama, :alamat, :handphone, :created_at, :updated_at
json.url user_url(user, format: :json)