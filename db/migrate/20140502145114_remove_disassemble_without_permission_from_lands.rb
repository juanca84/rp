class RemoveDisassembleWithoutPermissionFromLands < ActiveRecord::Migration
  def up
    remove_column :lands, :disassemble_without_permission
    add_column :lands, :ine_code, :string 
  end

  def down
    add_column :lands, :disassemble_without_permission, :boolean
    remove_column :lands, :ine_code 
  end
end
