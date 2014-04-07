class AddNewFieldsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :first_lastname, :string
    add_column :people, :second_lastname, :string
    add_column :people, :department_of_birth_id, :integer
    add_column :people, :province_of_birth_id, :string
    add_column :people, :type_of_identification_id, :integer
    add_column :people, :issued_id, :integer

    add_index :people, :department_of_birth_id
    add_index :people, :province_of_birth_id
    add_index :people, :type_of_identification_id
    add_index :people, :issued_id
  end
end
