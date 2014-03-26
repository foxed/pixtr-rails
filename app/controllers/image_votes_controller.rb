class ImageVotesController < ApplicationController
  def create
    image = Image.find(params[:id])
    current_user.vote image
    redirect_to image
  end
  def destroy 
    image = Image.find(params[:id])
    current_user.unvote image
    redirect_to image
  end
end
