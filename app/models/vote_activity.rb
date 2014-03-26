class VoteActivity < Activity
  def votable
    subject.votable
  end

  def votable_name
    votable.name
  end

  def email
    subject.user.email
  end
end
