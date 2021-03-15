json.extract! redirect, :id, :original_url, :created_at, :updated_at
json.url redirect_url(redirect, format: :json)
