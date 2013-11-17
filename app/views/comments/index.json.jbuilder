json.array!(@comments) do |comment|
  json.extract! comment, :content, :timestamp, :course_id, :user_id
  json.likes comment.likes
  json.dislikes comment.dislikes
  if user_signed_in?
	  j.like c.likes.where(:user_id => current_user.id).exists?
	  j.dislike c.dislikes.where(:user_id => current_user.id).exists?
  end
end
