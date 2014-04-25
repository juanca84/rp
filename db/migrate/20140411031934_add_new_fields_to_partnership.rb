class AddNewFieldsToPartnership < ActiveRecord::Migration
  def change
    add_column :partnerships, :community_name, :string
    add_column :partnerships, :community_legal_status, :boolean, default: false
    add_column :partnerships, :greater_community, :string
    add_column :partnerships, :productive_name_1, :string
    add_column :partnerships, :productive_legal_status_1, :boolean, default: false
    add_column :partnerships, :economic_activity_1_id, :integer
    add_column :partnerships, :first_entry_1, :string
    add_column :partnerships, :second_entry_1, :string
    add_column :partnerships, :productive_name_2, :string
    add_column :partnerships, :productive_legal_status_2, :boolean, default: false
    add_column :partnerships, :economic_activity_2_id, :integer
    add_column :partnerships, :first_entry_2, :string
    add_column :partnerships, :second_entry_2, :string

    add_index :partnerships, :economic_activity_1_id
    add_index :partnerships, :economic_activity_2_id
  end
end
