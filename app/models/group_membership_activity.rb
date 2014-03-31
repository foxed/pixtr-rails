class GroupMembershipActivity < Activity
  def member
    actor.email
  end

  def group
    target.group
  end
end
