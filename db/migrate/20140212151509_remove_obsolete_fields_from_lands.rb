class RemoveObsoleteFieldsFromLands < ActiveRecord::Migration
  def up
    remove_column :lands, :capital_item
    remove_column :lands, :current_value
    remove_column :lands, :lifespan_future
    remove_column :lands, :start_year
  end

  def down
    add_column :lands, :start_year, :integer
    add_column :lands, :lifespan_future, :float
    add_column :lands, :current_value, :float
    add_column :lands, :capital_item, :string
  end
end