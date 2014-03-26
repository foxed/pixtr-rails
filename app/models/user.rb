class User < ActiveRecord::Base
  include Clearance::User

  has_many :galleries, dependent: :destroy
  has_many :images, through: :galleries

  has_many :votes, dependent: :destroy
  has_many :voted_images,
    through: :votes,
    source: :votable,
    source_type: 'Image'

  has_many :voted_galleries,
    through: :votes,
    source: :votable,
    source_type: 'Gallery'

  has_many :group_images,
    through: :votes,
    source: :votable,
    source_type: 'Group'

  has_many :group_memberships, foreign_key: :member_id, dependent: :destroy
  has_many :groups, through: :group_memberships

  has_many :activities


  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy

  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship",
    dependent: :destroy

  has_many :followers,
    through: :follower_relationships

  def notify_followers(subject, type)
    followers.each do |follower|
      follower.activities.create(
        subject: subject,
        type: type
      )
    end
  end

  def follow(other_user)
    follow = followed_user_relationships.create(followed_user: other_user)
    notify_followers(follow, 'FollowActivity')
  end

  def unfollow(other_user)
    followed_users.destroy(other_user)
  end

  def following?(other_user)
    followed_user_ids.include? other_user.id
  end

  def join(group)
    group_membership = group_memberships.create(group: group)

    notify_followers(group_membership, 'GroupMembershipActivity')

  end

  def joined?(group)
    group_ids.include? group.id
  end

  def leave(group)
    groups.destroy(group)
  end

  def vote(target)
   vote = votes.create(votable: target)
   notify_followers(vote, 'VoteActivity')
  end

  def unvote(target)
    votes.find_by(votable: target).destroy
  end

  def voted?(target)
    votes.exists?(votable: target)
  end

end
