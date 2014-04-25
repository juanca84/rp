class ChangeDateTypeFromLands < ActiveRecord::Migration
  def change
    remove_column :lands, :own_labor
    remove_column :lands, :eventual_labor
    remove_column :lands, :permanent_labor
    remove_column :lands, :men_per_year_own
    remove_column :lands, :men_per_year_eventually
    remove_column :lands, :men_per_year_total

    add_column :lands, :own_labor, :integer, default: 0
    add_column :lands, :eventual_labor, :integer, default: 0
    add_column :lands, :permanent_labor, :integer, default: 0
    add_column :lands, :men_per_year_own, :float, default: 0
    add_column :lands, :men_per_year_eventually, :float, default: 0
    add_column :lands, :men_per_year_total, :float, default: 0
  end
end