class CreateMainActivities < ActiveRecord::Migration
  def change
    create_table :main_activities do |t|
      t.string :level
      t.string :summner_entry
      t.string :winter_entry
      t.references :register

      t.timestamps
    end
    add_index :main_activities, :register_id
  end
end
