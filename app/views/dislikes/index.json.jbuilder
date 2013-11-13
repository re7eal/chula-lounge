json.array!(@dislikes) do |dislike|
  json.extract! dislike, 
  json.url dislike_url(dislike, format: :json)
end
