class FollowingRelationship < ActiveRecord::Base
  belongs_to :followed_user, class_name: "User"
  belongs_to :follower, class_name: "User"

  validates :follower_id,
    uniqueness: { scope: :followed_user_id }

  validate :cannot_follow_self

  private

  def cannot_follow_self
    if followed_user_id == follower_id
      errors.add(:base, "Ay hold up! You can't follow yourself.")
    end
  end
end
