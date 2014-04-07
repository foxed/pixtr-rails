class TagsController < ApplicationController
  def show
    @tag = Tag.find_by!(name: params[:id])
    @images = Image.tagged_with(params[:id])
  end
end
