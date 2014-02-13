class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.references :land
      t.string :entry
      t.string :production_destination
      t.float :production_quantity, default: 0
      t.string :production_system
      t.string :production_unit
      t.float :productive_physical_coverage_amount, default: 0
      t.string :productive_physical_coverage_unit

      t.timestamps
    end
    add_index :productions, :land_id
  end
end