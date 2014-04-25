class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :code
      t.string :name
      t.references :department

      t.timestamps
    end
    add_index :provinces, :department_id
  end
end
