class AddMainActivityToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :subsector, :string
    add_column :registers, :first_entry, :string
    add_column :registers, :second_entry, :string
  end
end
