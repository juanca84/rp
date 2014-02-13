class RemoveObsoleteFiledsForProductionFromLands < ActiveRecord::Migration
  def up
    remove_column :lands, :entry
    remove_column :lands, :production_destination
    remove_column :lands, :production_quantity
    remove_column :lands, :production_system
    remove_column :lands, :production_unit
    remove_column :lands, :productive_physical_coverage_amount
    remove_column :lands, :productive_physical_coverage_unit
  end

  def down
    add_column :lands, :productive_physical_coverage_unit, :string
    add_column :lands, :productive_physical_coverage_amount, :float
    add_column :lands, :production_unit, :string
    add_column :lands, :production_system, :string
    add_column :lands, :production_quantity, :float
    add_column :lands, :production_destination, :string
    add_column :lands, :entry, :string
  end
end
