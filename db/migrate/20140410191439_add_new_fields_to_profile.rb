class AddNewFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :type_of_identification_id, :integer
    add_column :profiles, :issued_id, :integer

    add_index :profiles, :type_of_identification_id
    add_index :profiles, :issued_id
  end
end
