class RemoveNitFrom < ActiveRecord::Migration
  def up
    remove_column :entities, :nit
  end

  def down
    add_column :entities, :nit, :string
  end
end
