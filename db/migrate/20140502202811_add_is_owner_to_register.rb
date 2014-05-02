class AddIsOwnerToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :is_owner, :boolean, default: true
  end
end
