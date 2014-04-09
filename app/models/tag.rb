class Tag < ActiveRecord::Base
  has_many :images, through: :taggings

  def self.self_from_tag_list(tag_string)
    tag_string.split(",").map do |tag_name|
      find_or_create_by(name: tag_name.strip.downcase)
    end
  end
end
