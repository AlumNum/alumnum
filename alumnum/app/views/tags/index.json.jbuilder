json.array!(@tags) do |tag|
  json.extract! tag, :id, :skill_tag
  json.url tag_url(tag, format: :json)
end
