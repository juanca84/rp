class AddNewFieldsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :first_lastname, :string
    add_column :people, :second_lastname, :string
    add_column :people, :department_of_birth_id, :integer
    add_column :people, :province_of_birth_id, :string
    add_column :people, :type_of_identification_id, :integer
  end
end
