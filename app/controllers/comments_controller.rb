class CommentsController < ApplicationController
 
  def new
    @comment = Comment.new
  end 

  def create
    image = Image.find(params[:image_id])
    image.comments.create(comment_params)
    redirect_to image
  end

  def show
    @comment = Comment.find(:comment_id)
    @comment = Comments.all
  end
 
 private

 def comment_params
   params.require(:comment).permit(:user_id, :body).merge(user_id: current_user.id)
 end

end
