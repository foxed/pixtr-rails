class FollowerNotifier

  def notify_followers(subject, target, type)
    if subject.persisted?
      followers.each do |follower|
        follower.activities.create(
          subject: subject,
          type: type,
          actor: self,
          target: target
        )
        mail(follower, subject)
      end

    end
  end

  handle_asynchronously :notify_followers

end
