class AddNewFieldsToCapital < ActiveRecord::Migration
  def change
    add_column :capitals, :register_id, :integer
    add_column :capitals, :department_id, :integer
    add_column :capitals, :community_id, :integer
  end
end
