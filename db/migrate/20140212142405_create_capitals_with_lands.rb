class CreateCapitalsWithLands < ActiveRecord::Migration
  def change
    create_table :capitals do |t|
      t.string :capital_item
      t.float :current_value, default: 0
      t.float :lifespan_future
      t.integer :start_year
      t.references :land

      t.timestamps
    end
    add_index :capitals, :land_id
  end
end