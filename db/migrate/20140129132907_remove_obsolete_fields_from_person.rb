class RemoveObsoleteFieldsFromPerson < ActiveRecord::Migration
  def up
    remove_column :people, :first_lastname
    remove_column :people, :second_lastname
    remove_column :people, :type_identification_id
    remove_column :people, :ethnicity_id
  end

  def down
    add_column :people, :ethnicity_id, :integer
    add_column :people, :type_identification_id, :integer
    add_column :people, :second_lastname, :string
    add_column :people, :first_lastname, :string
  end
end
