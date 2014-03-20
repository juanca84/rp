class AddActivationDateToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :activation_date, :datetime
  end
end
