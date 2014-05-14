class AddMorefields3ToPartnership < ActiveRecord::Migration
  def change
    add_column :partnerships, :economic_activity_1_3_id, :integer
    add_column :partnerships, :economic_activity_2_3_id, :integer
    add_column :partnerships, :first_entry_1_3, :string
    add_column :partnerships, :second_entry_1_3, :string
    add_column :partnerships, :first_entry_2_3, :string
    add_column :partnerships, :second_entry_2_3, :string
    add_column :partnerships, :third_entry_1_1, :string
    add_column :partnerships, :third_entry_1_2, :string
    add_column :partnerships, :third_entry_1_3, :string
    add_column :partnerships, :third_entry_2_1, :string
    add_column :partnerships, :third_entry_2_2, :string
    add_column :partnerships, :third_entry_2_3, :string

    add_index :partnerships, :economic_activity_1_3_id
    add_index :partnerships, :economic_activity_2_3_id
  end
end
