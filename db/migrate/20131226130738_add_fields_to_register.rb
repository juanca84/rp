class AddFieldsToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :civil_union_id, :integer
    add_column :registers, :residence, :string
    add_column :registers, :address, :string
    add_column :registers, :department_id, :integer
    add_column :registers, :community_id, :integer
    add_column :registers, :geodesic_ns, :string
    add_column :registers, :geodesic_ew, :string

    add_index :registers, :civil_union_id
    add_index :registers, :department_id
    add_index :registers, :community_id
  end
end
