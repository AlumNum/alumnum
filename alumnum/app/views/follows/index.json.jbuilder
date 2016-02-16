json.array!(@follows) do |follow|
  json.extract! follow, :id, :user_id, :tag_id
  json.url follow_url(follow, format: :json)
end
