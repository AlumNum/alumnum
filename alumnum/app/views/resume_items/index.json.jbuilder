json.array!(@resume_items) do |resume_item|
  json.extract! resume_item, :id, :title, :heading, :start_date, :end_date, :description, :kind
  json.url resume_item_url(resume_item, format: :json)
end
