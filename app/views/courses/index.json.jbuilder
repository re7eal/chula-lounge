json.array!(@courses) do |course|
  json.extract! course, :id, :title, :number, :description, :year
  json.url course_url(course, format: :json)
end
