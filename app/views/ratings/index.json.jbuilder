json.array!(@ratings) do |rating|
  json.extract! rating, :know_rating, :diff_rating, :grade_rating, :course_id, :user_id
  json.url rating_url(rating, format: :json)
end
