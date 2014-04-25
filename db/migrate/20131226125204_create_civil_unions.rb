class CreateCivilUnions < ActiveRecord::Migration
  def change
    create_table :civil_unions do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
