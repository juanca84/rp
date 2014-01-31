class RemoveRegisterIdFromPartnerships < ActiveRecord::Migration
  def up
    remove_column :partnerships, :register_id
  end

  def down
    add_column :partnerships, :register_id, :integer
    add_index :partnerships, :register_id
  end
end
