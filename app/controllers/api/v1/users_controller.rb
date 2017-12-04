class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    # @user = User.new(params)
    #
    # if @user.save
    #   render json: @note
    # else
    #   render index.html
    # end
  end

end
