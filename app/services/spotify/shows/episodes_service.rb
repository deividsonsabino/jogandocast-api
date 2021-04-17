module Spotify
  module Shows
    class EpisodesService
      ESPISODES_ENDPOINT = ENV['SPOTIFY_API_BASE_URL'] + '/v1/shows/6rV1d1mPXEIaPD3S9mkZk5'.freeze

      class << self
        def call
          token = Spotify::AuthService.new.call

          get_episodes(token)
        rescue StandardError => e
          puts e.message
          puts e.backtrace

          raise e
        end

        private

        def get_episodes(token)
          query = { market: 'BR' }

          HttpClient::Request.get(ESPISODES_ENDPOINT, query: query, headers: headers(token))
        end

        def headers(token)
          {
            'Authorization': "Bearer #{token}",
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }
        end
      end
    end
  end
end