json.errors do
  json.message message if defined?(message) && message.present?
end