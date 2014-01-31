class CreatePartnershipsRegisters < ActiveRecord::Migration
  def change
    create_table :partnerships_registers do |t|
      t.references :register
      t.references :partnership

      t.timestamps
    end
    add_index :partnerships_registers, :register_id
    add_index :partnerships_registers, :partnership_id
  end
end
