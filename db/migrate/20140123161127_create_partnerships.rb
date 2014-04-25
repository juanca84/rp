class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.string :name
      t.string :code
      t.references :register

      t.timestamps
    end
    add_index :partnerships, :register_id
  end
end
