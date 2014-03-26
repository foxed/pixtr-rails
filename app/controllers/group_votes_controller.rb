class GroupVotesController < ApplicationController
  def create
    group = Group.find(params[:id])
    current_user.vote group
    redirect_to group
  end
  def destroy 
    group = Group.find(params[:id])
    current_user.unvote group
    redirect_to group
  end

end
