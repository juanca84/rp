class AddFieldsWorksToLand < ActiveRecord::Migration
  def change
    add_column :lands, :own_labor, :integer
    add_column :lands, :eventual_labor, :integer
    add_column :lands, :permanent_labor, :integer
    add_column :lands, :men_per_year_own, :integer
    add_column :lands, :men_per_year_eventually, :integer
    add_column :lands, :men_per_year_total, :integer
  end
end
