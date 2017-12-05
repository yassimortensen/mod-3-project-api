class Api::V1::StoryStagesController < ApplicationController

  def index
    stories = StoryStage.all
    render json: stories, include: :pic
  end

end
