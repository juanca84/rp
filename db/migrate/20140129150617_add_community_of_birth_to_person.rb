class AddCommunityOfBirthToPerson < ActiveRecord::Migration
  def change
    add_column :people, :community_of_birth_id, :integer
  end
end
