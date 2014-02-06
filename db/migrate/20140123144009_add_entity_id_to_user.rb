class AddEntityIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :entity_id, :integer
    add_index :users, :entity_id
  end
end