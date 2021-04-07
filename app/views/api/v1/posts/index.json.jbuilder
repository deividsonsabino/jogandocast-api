json.posts do
  json.array! @posts do |post|
    json.(post, :id, :title, :description, :created_at)
    json.author post.author.name
    json.image_url url_for(post.image)
  end
end