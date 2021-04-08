namespace :scheduler do
  desc "Sync JogandoCast episodes from spotify in database"
  task spotify_sync: :environment do
    Spotify::SyncService.call
  end

end
