ActiveAdmin.register Episode do
  actions :index

  config.sort_order = "release_date_desc"
  config.per_page = 10

  collection_action :import_csv, method: :post do
    # Do some CSV importing work here...
    redirect_to collection_path, notice: "CSV imported successfully!"
  end

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

  action_item :sync do
    link_to 'Sync Spotify', admin_episodes_sync_path
  end


  controller do
    def sync
      begin
        Spotify::SyncService.call

        redirect_to admin_episodes_path, notice: "Episodes synced with success!"
      rescue
        redirect_to admin_episodes_path, flash: { error: "Error when syncing" }
      end
    end
  end
end