json.post do
  json.(@post, :id, :title, :content, :description, :created_at, :updated_at)
  json.author @post.author.name
  json.image_url url_for(@post.image)
end