class AddRegisterIdToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :register_id, :integer
    add_index :versions, :register_id
  end
end