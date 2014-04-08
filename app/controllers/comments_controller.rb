class CommentsController < ApplicationController
  def create
    image = Image.find(params[:image_id])
    comment = image.comments.new(comment_params)
    if comment.save
      current_user.notify_followers(comment, image, 'CommentActivity')
      redirect_to image, notice: "Commented Successful!"
    else
      redirect_to image, alert: "Cannot comment with an empty comment."
    end
  end

 private

 def comment_params
   params.require(:comment).
     permit(:user_id, :body).
     merge(user_id: current_user.id)
 end

end
