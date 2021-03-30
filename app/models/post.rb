class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :author, class_name: "AdminUser", foreign_key: "admin_user_id"
end
