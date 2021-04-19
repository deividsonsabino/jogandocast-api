module Spotify
  class SyncService
    LIMIT = 10

    class << self
      def call(sync_all: false)
        episodes = Spotify::Shows::EpisodesService.new(limit: LIMIT, offset: 0).call
        
        persists_episodes(episodes[:items])

        return sync_all_episodes(episodes) if sync_all
      end

      private

      def sync_all_episodes(episodes)
        max_offset = episodes[:total] / 10
        return if max_offset < 1

        (1..max_offset).each do |offset|
          episodes = Spotify::Shows::EpisodesService.new(limit: LIMIT, offset: offset * LIMIT).call

          persists_episodes(episodes[:items])
        end
      end

      def persists_episodes(episodes)
        episodes.each do |episode|
          next if Episode.where(id: episode[:id]).exists?

          Episode.create!(
            id: episode[:id],
            name: episode[:name],
            description: episode[:description],
            duration: episode[:duration_ms],
            link: episode[:href],
            preview_url: episode[:audio_preview_url],
            image_url: episode[:images].first
          )
        end
      end
    end
  end
end