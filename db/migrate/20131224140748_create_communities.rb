class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :code
      t.string :name
      t.references :province

      t.timestamps
    end
    add_index :communities, :province_id
  end
end
