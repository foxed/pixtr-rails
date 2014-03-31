class ImageVotesController < ApplicationController
  def create
    @image = Image.find(params[:id])
    current_user.vote @image
    render :change
  end
  def destroy 
    @image = Image.find(params[:id])
    current_user.unvote @image
    render :change
  end
end
