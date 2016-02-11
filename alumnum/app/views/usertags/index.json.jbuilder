json.array!(@usertags) do |usertag|
  json.extract! usertag, :id, :user_id, :tag_id
  json.url usertag_url(usertag, format: :json)
end
