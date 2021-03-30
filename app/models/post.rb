class Post < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end

  belongs_to :author, class_name: "AdminUser", foreign_key: "admin_user_id"
end
