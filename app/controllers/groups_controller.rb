class GroupsController < ApplicationController
  before_action :authorize

  def index
    @groups = current_user.groups
  end
  
  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      @group.members << current_user
      redirect_to @group
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
