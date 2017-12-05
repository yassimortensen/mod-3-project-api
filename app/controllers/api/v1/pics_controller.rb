class Api::V1::PicsController < ApplicationController

  def index
    @pics = Pic.all
    render json: @pics, include: [:story_stages]
  end

end
