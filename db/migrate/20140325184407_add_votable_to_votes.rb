class AddVotableToVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :image_id, :votable_id
    add_column :votes, :votable_type, :string

    remove_index :votes, :votable_id
    add_index :votes, [:votable_id, :votable_type]

    update "UPDATE votes SET votable_type = 'Image'"
  end
end
