class FollowerNotifier

  def initialize(user)
    @user = user
  end

  def notify_followers(subject, target)
    if subject.persisted?
      user.followers.each do |follower|
        follower.activities.create(
          subject: subject,
          type: type(subject),
          actor: user,
          target: target
        )
      end
    end
  end

  handle_asynchronously :notify_followers

  private
  attr_reader :user

  def type(subject)
    "#{subject.class}Activity"
  end
end
