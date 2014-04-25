class AddTownOfBirthToPeopleRegister < ActiveRecord::Migration
  def change
    add_column :people_registers, :town_of_birth, :string
  end
end
