class AddRegisterIdToPartnership < ActiveRecord::Migration
  def change
    add_column :partnerships, :register_id, :integer
  end
end
