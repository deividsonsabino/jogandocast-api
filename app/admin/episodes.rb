ActiveAdmin.register Episode do
  config.sort_order = "release_date_desc"
  config.per_page = 10

  index do
    column :image do |episode|
      image_tag(episode.image_url, size: "120x120")
    end
    column :name
    column :description
    column :duration
    column :preview do |episode|
      audio_tag(episode.preview_url, controls: true)
    end
    column :link do |episode|
      link_to "Spotify", episode.link, target: "_blank"
    end
    column :release_date
    column :created_at
  end

  filter :name
  filter :description
end