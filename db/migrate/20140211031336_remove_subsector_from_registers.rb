class RemoveSubsectorFromRegisters < ActiveRecord::Migration
  def up
    remove_column :registers, :subsector
  end

  def down
    add_column :registers, :subsector, :string
  end
end
