class CreateTypeIdentifications < ActiveRecord::Migration
  def change
    create_table :type_identifications do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
