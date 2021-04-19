class Episode < ApplicationRecord
  self.primary_key = :id
  
  validates :name, :description, :duration, :link, :preview_url, :image_url, presence: true
end
