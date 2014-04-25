class CreateTypeResidences < ActiveRecord::Migration
  def change
    create_table :type_residences do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
