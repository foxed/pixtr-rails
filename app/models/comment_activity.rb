class CommentActivity < Activity
  def comment
    subject.body
  end 

  def image
    subject.image
  end

  def image_name
    subject.image.name
  end

  def user
    subject.user.email
  end
end
