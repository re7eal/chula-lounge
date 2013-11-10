json.array!(@trades) do |trade|
  json.extract! trade, :id, :finished, :created_at
  json.user do
    json.(trade.user, :name)
    json.url user_url(trade.user)
  end
  json.have_courses trade.have_courses, :course_number, :course_name, :course_section
  json.want_courses trade.want_courses, :course_number, :course_name, :course_section
  json.url trade_url(trade)
  
end
