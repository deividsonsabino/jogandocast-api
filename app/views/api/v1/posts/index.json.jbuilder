json.posts do
  json.array! @posts do |post|
    json.(post, :id, :title, :description, :image_base64, :created_at)
    json.author post.author.name
  end
end