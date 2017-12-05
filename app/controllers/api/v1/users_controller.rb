class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render index.html
    end
  end

  private

  def user_params
    params.permit(:name, :characterName, :favFood, :firstJob, :favAnimal)
  end

end
