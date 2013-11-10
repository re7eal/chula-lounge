json.array!(@want_courses) do |want_course|
  json.extract! want_course, :course_number, :course_name, :course_section, :trade_id
  json.url want_course_url(want_course, format: :json)
end
