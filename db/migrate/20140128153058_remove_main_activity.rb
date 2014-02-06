class RemoveMainActivity < ActiveRecord::Migration
  def change
  	drop_table :main_activities
  end
end
