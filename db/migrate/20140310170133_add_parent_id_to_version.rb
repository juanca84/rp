class AddParentIdToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :parent_id, :integer
    add_index :versions, :parent_id
  end
end
