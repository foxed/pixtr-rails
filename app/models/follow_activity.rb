class FollowActivity < Activity
  def follower_display
    subject.follower.email
  end
  def following_display
    subject.followed_user.email
  end
end
