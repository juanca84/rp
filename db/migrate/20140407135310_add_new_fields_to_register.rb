class AddNewFieldsToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :issued_id, :integer
    add_column :registers, :type_residence_id, :integer
  end
end
