class GalleryVotesController < ApplicationController
  def create
    gallery = Gallery.find(params[:id])
    vote = current_user.vote gallery
    notify_followers(vote, gallery)
    redirect_to gallery
  end
  def destroy 
    gallery = Gallery.find(params[:id])
    current_user.unvote gallery
    redirect_to gallery
  end

end
