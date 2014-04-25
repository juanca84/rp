class RemoveCivilUnionIdFromRegister < ActiveRecord::Migration
  def up
    remove_column :registers, :civil_union_id
  end

  def down
    add_column :registers, :civil_union_id, :integer
  end
end
