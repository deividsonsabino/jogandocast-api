json.posts do
  json.array! @posts do |post|
    json.partial! post
  end
end