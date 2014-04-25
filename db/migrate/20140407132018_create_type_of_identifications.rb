class CreateTypeOfIdentifications < ActiveRecord::Migration
  def change
    create_table :type_of_identifications do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
