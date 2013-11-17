json.extract! @course, :title, :number, :description, :year, :created_at, :updated_at

json.teaches @teaches
json.ratings @course.ratings do |j, r|
  j.extract! r, :know_rating, :diff_rating, :grade_rating
end

json.comments @comments do |j, c|
  j.extract! c, :id, :content, :created_at
  j.name c.user.name
  j.likes c.likes.count
  j.dislikes c.dislikes.count
  if user_signed_in?
	  j.like c.likes.where(:user_id => current_user.id).exists?
	  j.dislike c.dislikes.where(:user_id => current_user.id).exists?
  end
end