class AddSecondEconomicActivityToPartnership < ActiveRecord::Migration
  def change
    add_column :partnerships, :economic_activity_1_2_id, :integer
    add_column :partnerships, :first_entry_1_2, :string
    add_column :partnerships, :second_entry_1_2, :string
    add_column :partnerships, :economic_activity_2_2_id, :integer
    add_column :partnerships, :first_entry_2_2, :string
    add_column :partnerships, :second_entry_2_2, :string
    rename_column :partnerships, :economic_activity_1_id, :economic_activity_1_1_id
    rename_column :partnerships, :first_entry_1, :first_entry_1_1
    rename_column :partnerships, :second_entry_1, :second_entry_1_1
    rename_column :partnerships, :economic_activity_2_id, :economic_activity_2_1_id
    rename_column :partnerships, :first_entry_2, :first_entry_2_1
    rename_column :partnerships, :second_entry_2, :second_entry_2_1
  end
end
