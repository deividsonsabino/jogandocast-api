class Api::V1::EpisodesController < Api::V1::ApiController
  before_action :set_post, only: [:show]

  def index
    @episodes = Episode.release_desc
  end
end
