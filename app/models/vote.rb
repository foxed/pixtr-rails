class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :actor, class_name: "User"
  belongs_to :votable, polymorphic: true

  has_many :activities, as: :subject, dependent: :destroy

  validates :votable, presence: true
end
