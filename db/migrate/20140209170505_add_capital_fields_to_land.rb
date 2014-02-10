class AddCapitalFieldsToLand < ActiveRecord::Migration
  def change
    add_column :lands, :capital_item, :string
    add_column :lands, :start_year, :integer
    add_column :lands, :lifespan_future, :float
    add_column :lands, :current_value, :float
  end
end
