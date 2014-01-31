class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :business_name
      t.text :description

      t.timestamps
    end
  end
end
