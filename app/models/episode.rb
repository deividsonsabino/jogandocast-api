class Episode < ApplicationRecord
  validates :name, :description, :duration, :link, :preview_url, :image_rl, presence: true
end
