class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :description
      t.integer :user_id

      t.integer :department_id
      t.integer :province_id
      t.integer :community_id
      t.integer :type_residence_id
      t.string :residence
      t.string :oecom_name
      t.boolean :legal_status_oecom, default: false
      t.string :greater_oecom_name

      t.timestamps
    end
    add_index :templates, :user_id
    add_index :templates, :department_id
    add_index :templates, :province_id
    add_index :templates, :community_id
    add_index :templates, :type_residence_id
  end
end
