class AddLocationToLand < ActiveRecord::Migration
  def change
    add_column :lands, :department_id, :integer
    add_column :lands, :community_id, :integer
    add_column :lands, :another_community, :string

    add_index :lands, :department_id
    add_index :lands, :community_id
  end
end
