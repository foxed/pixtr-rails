class GroupVotesController < ApplicationController
  def create
    group = Group.find(params[:id])
    vote = current_user.vote group
    notify_followers(vote, group)
    redirect_to group
  end
  def destroy 
    group = Group.find(params[:id])
    current_user.unvote group
    redirect_to group
  end

end
