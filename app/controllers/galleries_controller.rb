class GalleriesController < ApplicationController  
  before_action :authorize, except: [:show]
  
  def index
    @galleries = current_user.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new 
    @gallery = Gallery.new 
  end

  def create
    gallery = current_user.galleries.create(gallery_params)
    redirect_to gallery
  end

  def edit
    @gallery = current_user.galleries.find(params[:gallery_id])
  end

  def update
    gallery = current_user.galleries.find(params[:id])
    gallery.update(gallery_params)
    redirect_to gallery
  end

  def destroy
    gallery = current_user.galleries.find(params[:id])
    gallery.destroy
    redirect_to root_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
