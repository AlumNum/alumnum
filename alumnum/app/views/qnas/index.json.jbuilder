json.array!(@qnas) do |qna|
  json.extract! qna, :id, :user_id, :question_id, :response
  json.url qna_url(qna, format: :json)
end
