class RemoveTimeToLandFromPeopleRegisters < ActiveRecord::Migration
  def up
    remove_column :people_registers, :time_to_land
  end

  def down
    add_column :people_registers, :time_to_land, :integer
  end
end
