class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.integer :own_labor, default: 0
      t.integer :eventual_labor, default: 0
      t.integer :permanent_labor, default: 0
      t.float :men_per_year_own, default: 0
      t.float :men_per_year_eventually, default: 0
      t.float :men_per_year_total, default: 0
      t.references :register

      t.timestamps
    end
    add_index :works, :register_id
  end
end
