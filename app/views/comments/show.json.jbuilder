json.extract! @comment, :content, :timestamp, :course_id, :user_id, :created_at, :updated_at

json.like @comment.likes, :user_id, :comment_id
json.dislike @comment.dislikes, :user_id, :comment_id