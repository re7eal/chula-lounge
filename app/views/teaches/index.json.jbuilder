json.array!(@teaches) do |teach|
  json.extract! teach, :professor_id, :course_id, :year
  json.url teach_url(teach, format: :json)
end
