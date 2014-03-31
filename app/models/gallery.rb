class Gallery < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_many :activities, as: :subject, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  belongs_to :user
  belongs_to :actor, class_name: "User"

  validates :name, presence: true
  validates :user, presence: true
end
