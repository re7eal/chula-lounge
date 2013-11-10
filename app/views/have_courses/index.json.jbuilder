json.array!(@have_courses) do |have_course|
  json.extract! have_course, :course_number, :course_name, :course_section, :trade_id
  json.url have_course_url(have_course, format: :json)
end
