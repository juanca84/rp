class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :department
      t.references :community
      t.references :register
      t.integer :own_labor
      t.integer :eventual_labor
      t.integer :permanent_labor
      t.float :men_per_year_own
      t.float :men_per_year_eventually
      t.float :men_per_year_total

      t.timestamps
    end
    add_index :works, :department_id
    add_index :works, :community_id
    add_index :works, :register_id
  end
end
