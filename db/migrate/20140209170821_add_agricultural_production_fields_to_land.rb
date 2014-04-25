class AddAgriculturalProductionFieldsToLand < ActiveRecord::Migration
  def change
    add_column :lands, :entry, :string
    add_column :lands, :physical_coverage_amount, :float
    add_column :lands, :physical_coverage_unit, :string
    add_column :lands, :production_quantity, :float
    add_column :lands, :production_unit, :string
    add_column :lands, :production_system, :string
    add_column :lands, :production_destination, :string
  end
end
