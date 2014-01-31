class ChangeFieldsFromMainActivity < ActiveRecord::Migration
  def up
    remove_column :main_activities, :level
    remove_column :main_activities, :summner_entry
  	remove_column :main_activities, :winter_entry
    add_column :main_activities, :subsector, :string
    add_column :main_activities, :first_entry, :string
    add_column :main_activities, :second_entry, :string
  end

  def down
    add_column :main_activities, :level, :string
    add_column :main_activities, :summner_entry, :string
    add_column :main_activities, :winter_entry, :string
    remove_column :main_activities, :subsector
    remove_column :main_activities, :first_entry
    remove_column :main_activities, :second_entry
  end
end