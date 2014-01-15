class CreateProfileUsers < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :last_name
      t.string :identification
      t.string :birthdate
      t.string :sex
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
