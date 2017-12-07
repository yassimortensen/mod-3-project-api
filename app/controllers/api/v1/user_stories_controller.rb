class Api::V1::UserStoriesController < ApplicationController

  def index
    @userstories = UserStory.all
    render json: @userstories
  end

  def create
    @userstory = UserStory.new(userstory_params)
    if @userstory.save
      render json: @userstory
    else
      render index.html
    end
  end

  private

  def userstory_params
    params.permit(:user_id, :story_stage_id)
  end

end
