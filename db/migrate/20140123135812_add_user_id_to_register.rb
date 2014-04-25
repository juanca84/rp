class AddUserIdToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :user_id, :integer
    add_index :registers, :user_id
  end
end
