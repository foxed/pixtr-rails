class CommentsController < ApplicationController
 
  def new
    @comment = Comment.new
  end 

  def create
    image = Image.find(params[:image_id])
    @comment = image.comments.new(comment_params)
    if @comment.save
      current_user.notify_followers(@comment, image, 'CommentActivity')
    end
  end

  def show
    @comment = Comment.find(:comment_id)
    @comment = Comments.all.recent
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
 
 private

 def comment_params
   params.require(:comment).permit(:user_id, :body).merge(user_id: current_user.id)
 end

end
# merge is doing this, it is merging hashes 
#{ "body" = > "fodf", "user_id" => "3" }
