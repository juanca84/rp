class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :first_lastname
      t.string :second_lastname
      t.string :identification
      t.date :birthdate
      t.string :sex

      t.timestamps
    end
  end
end
