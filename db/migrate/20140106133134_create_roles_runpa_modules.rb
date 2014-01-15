class CreateRolesRunpaModules < ActiveRecord::Migration
  def change
    create_table :roles_runpa_modules do |t|
      t.references :role
      t.references :runpa_module

      t.timestamps
    end
    add_index :roles_runpa_modules, :role_id
    add_index :roles_runpa_modules, :runpa_module_id
  end
end
