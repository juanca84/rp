class CreateAgriculturalProductions < ActiveRecord::Migration
  def change
    create_table :agricultural_productions do |t|
      t.references :department
      t.references :community
      t.references :register
      t.string :entry
      t.integer :physical_coverage_amount
      t.string :physical_coverage_unit
      t.integer :production_quantity
      t.string :production_unit
      t.string :production_system
      t.string :production_destination

      t.timestamps
    end
    add_index :agricultural_productions, :department_id
    add_index :agricultural_productions, :community_id
    add_index :agricultural_productions, :register_id
  end
end
