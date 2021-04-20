class Post < ApplicationRecord
  has_one :image, as: :imageable, dependent: :destroy

  belongs_to :author, class_name: "AdminUser", foreign_key: "admin_user_id"

  validates :title, :photo, :image, :content, :description, presence: true

  attr_accessor :photo

  before_validation do
    return unless photo.present?

    file = Base64.encode64(photo.tempfile.read)
    return if file == self.image

    if self.image.present?
      self.image.content = file
      self.image.name = photo.original_filename
      self.content_type = photo.content_type
    else
      self.image = Image.new(content: file, name: photo.original_filename)
    end
  end
end
