class AddTimeToLandToPeopleRegister < ActiveRecord::Migration
  def change
    add_column :people_registers, :time_to_land, :integer, default: 0
  end
end
