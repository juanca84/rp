class AddManagerTypeIdToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :manager_type_id, :integer
    add_index :registers, :manager_type_id
  end
end
