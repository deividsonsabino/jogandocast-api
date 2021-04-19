class Episode < ApplicationRecord
  self.primary_key = :id
  
  validates :name, :description, :duration, :link, :preview_url, 
            :image_url, :release_date, presence: true

  scope :release_desc, -> { order(release_date: :desc)}
end
