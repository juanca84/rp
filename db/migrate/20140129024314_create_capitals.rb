class CreateCapitals < ActiveRecord::Migration
  def change
    create_table :capitals do |t|
      t.references :department
      t.references :community
      t.references :register
      t.string :capital_item
      t.date :start_year
      t.float :lifespan_future
      t.float :current_value

      t.timestamps
    end
    add_index :capitals, :department_id
    add_index :capitals, :community_id
    add_index :capitals, :register_id
  end
end
