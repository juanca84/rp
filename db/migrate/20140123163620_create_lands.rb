class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.float :surface
      t.string :unit_of_measure
      t.string :tenure
      t.boolean :disassemble_without_permission, default: false
      t.references :register

      t.timestamps
    end
    add_index :lands, :register_id
  end
end
