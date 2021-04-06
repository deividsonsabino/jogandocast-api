json.(post, :id, :title, :content, :created_at, :updated_at)
json.author post.author.name
json.image_url url_for(post.image)