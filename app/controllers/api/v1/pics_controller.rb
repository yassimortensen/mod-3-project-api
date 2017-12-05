class Api::V1::PicsController < ApplicationController

  def index
    @pics = Pics.all
    render json: @pics
  end

end
