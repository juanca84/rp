class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.boolean :active, default: true
      t.string :description
      t.integer :user_id
      t.integer :department_of_birth_id
      t.integer :province_of_birth_id
      t.integer :community_of_birth_id
      t.integer :issued_id
      t.integer :type_residence_id
      t.string :residence
      t.integer :department_id
      t.integer :community_id
      t.integer :emission_department_id
      t.integer :emission_community_id

      t.timestamps
    end
    add_index :templates, :user_id
    add_index :templates, :department_of_birth_id
    add_index :templates, :province_of_birth_id
    add_index :templates, :community_of_birth_id
    add_index :templates, :issued_id
    add_index :templates, :type_residence_id
    add_index :templates, :department_id
    add_index :templates, :community_id
    add_index :templates, :emission_department_id
    add_index :templates, :emission_community_id
  end
end
