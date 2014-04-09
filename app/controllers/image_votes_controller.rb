class ImageVotesController < ApplicationController
  def create
    @image = Image.find(params[:id])
    vote = current_user.vote @image
    notify_followers(vote, @image)
    render :change
  end

  def destroy 
    @image = Image.find(params[:id])
    current_user.unvote @image
    render :change
  end

end
