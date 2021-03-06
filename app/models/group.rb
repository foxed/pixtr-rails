class Group < ActiveRecord::Base
  has_many :group_memberships, dependent: :destroy
  has_many :members, through: :group_memberships

  has_many :group_images, dependent: :destroy
  has_many :images, through: :group_images

  has_many :votes, as: :votable, dependent: :destroy
  has_many :activities

  validates :name, presence: true

  private

  def add_member(member)
    members << member
  end
end
