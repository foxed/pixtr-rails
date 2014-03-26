class GroupMembershipActivity < Activity
  def member
    subject.member.email
  end

  def group
    subject.group
  end
end
