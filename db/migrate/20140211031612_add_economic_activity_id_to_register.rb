class AddEconomicActivityIdToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :economic_activity_id, :integer
    add_index :registers, :economic_activity_id
  end
end
