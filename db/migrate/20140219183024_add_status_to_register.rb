class AddStatusToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :status, :string
  end
end
