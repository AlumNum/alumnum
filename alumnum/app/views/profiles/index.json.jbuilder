json.array!(@profiles) do |profile|
  json.extract! profile, :id, :headline, :image_url, :bio, :view_count, :status, :twitter, :github, :peronal_site, :linkedin
  json.url profile_url(profile, format: :json)
end
