class AddNewFieldsToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :type_residence_id, :integer
    add_index :registers, :type_residence_id
  end
end
