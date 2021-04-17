module Spotify
  class AuthService
    AUTH_ENDPOINT = ENV['SPOTIFY_AUTH_BASE_URL'] + '/token'.freeze
    SPOTIFY_CLIENT_ID = ENV['SPOTIFY_CLIENT_ID'].freeze
    SPOTIFY_CLIENT_SECRET = ENV['SPOTIFY_CLIENT_SECRET'.freeze]

    attr_reader :refresh

    def initialize(refresh: true)
      @refresh = refresh
    end

    def call
      query = { grant_type: "client_credentials" }

      request_token if refresh
    end

    private

    def request_token
      body = { grant_type: "client_credentials" }

      response = HttpClient::Request.post(AUTH_ENDPOINT, body: body, headers: headers)

      response[:access_token]
    end

    def headers
      {
        Authorization: ActionController::HttpAuthentication::Basic
          .encode_credentials(SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET)
      }
    end
  end
end