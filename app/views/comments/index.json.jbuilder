json.array!(@comments) do |comment|
  json.extract! comment, :content, :timestamp, :course_id, :user_id
  json.url comment_url(comment, format: :json)
end
