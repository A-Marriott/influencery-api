class Api::V1::InfluencersController < ApplicationController
  def index
    @influencers = Influencer.all
    render json: @influencers
  end
end
