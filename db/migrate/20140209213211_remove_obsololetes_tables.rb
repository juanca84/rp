class RemoveObsololetesTables < ActiveRecord::Migration
  def change
    drop_table :works
    drop_table :agricultural_productions
  end
end