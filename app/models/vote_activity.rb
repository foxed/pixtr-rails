class VoteActivity < Activity
  def votable
    target
  end

  def votable_name
    target.name
  end

  def email
    actor.email
  end
end
