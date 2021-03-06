class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images.includes(:gallery)
  end
end
