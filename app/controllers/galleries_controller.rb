class GalleriesController < ApplicationController
  before_action :authorize, except: [:show]
  respond_to :html

  def index
    @galleries = current_user.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images.includes(gallery: [:user])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = find_gallery
    if @gallery.save
      current_user.notify_followers(@gallery, @gallery, 'GalleryActivity')
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @gallery = current_user.galleries.find(params[:id])
  end

  def update
    @gallery = find_gallery
    @gallery.update(gallery_params)
    respond_with @gallery
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
  
  def find_gallery
    @gallery = current_user.galleries.find(params[:id])
  end
end
