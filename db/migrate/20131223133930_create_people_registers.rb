class CreatePeopleRegisters < ActiveRecord::Migration
  def change
    create_table :people_registers do |t|
      t.references :person
      t.references :register
      t.string :type_person

      t.timestamps
    end
    add_index :people_registers, :person_id
    add_index :people_registers, :register_id
  end
end
