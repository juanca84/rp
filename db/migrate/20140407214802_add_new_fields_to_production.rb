class AddNewFieldsToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :register_id, :integer
    add_column :productions, :department_id, :integer
    add_column :productions, :community_id, :integer
  end
end
