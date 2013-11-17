json.extract! @comment, :id, :content, :timestamp, :course_id, :user_id, :created_at, :updated_at

json.likes @comment.likes.count
json.dislikes @comment.dislikes.count
json.like @comment.likes
json.dislike @comment.dislikes
json.name @comment.user.name