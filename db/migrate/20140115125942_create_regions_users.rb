class CreateRegionsUsers < ActiveRecord::Migration
  def change
    create_table :regions_users do |t|
      t.references :user
      t.integer :regionable_id
      t.string :regionable_type

      t.timestamps
    end
    add_index :regions_users, :user_id
    add_index :regions_users, [:regionable_id, :regionable_type]
  end
end
