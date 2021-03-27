class Post < ApplicationRecord
  belongs_to :author, class_name: "AdminUser", foreign_key: "admin_user_id"
end
