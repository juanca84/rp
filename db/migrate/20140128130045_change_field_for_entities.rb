class ChangeFieldForEntities < ActiveRecord::Migration
  def up
  	add_column :entities, :nit, :string
  	remove_column :entities, :name
  end

  def down
  	remove_column  :entities, :nit
  	add_column :entities, :name, :string
  end
end