class AddFieldsToPeopleRegister < ActiveRecord::Migration
  def change
    add_column :people_registers, :time_to_land, :integer
    add_column :people_registers, :mothers_name, :string
  end
end
