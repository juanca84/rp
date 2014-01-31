class AddFieldsEmmissionPlaceAndDateToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :emission_date, :date
    add_column :registers, :emission_department_id, :integer
    add_column :registers, :emission_community_id, :integer

    add_index :registers, :emission_department_id
    add_index :registers, :emission_community_id
  end
end
