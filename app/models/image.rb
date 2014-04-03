class Image < ActiveRecord::Base
  acts_as_taggable

  belongs_to :gallery
  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  has_many :activities

  has_many :group_images, dependent: :destroy
  has_many :groups, through: :group_images

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true

  def user
    gallery.user
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      puts "no results"
    end
  end

end
