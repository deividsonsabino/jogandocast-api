class Post < ApplicationRecord
  include FileUploader

  belongs_to :author, class_name: "AdminUser", foreign_key: "admin_user_id"

  validates :title, :image, :content, :description, presence: true
end
