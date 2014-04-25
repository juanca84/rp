class RemoveObsoleteFieldsFromPeopleRegisters < ActiveRecord::Migration
  def up
    remove_column :people_registers, :mothers_name
  end

  def down
    add_column :people_registers, :mothers_name, :string
  end
end
