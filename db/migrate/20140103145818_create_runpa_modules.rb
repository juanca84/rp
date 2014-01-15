class CreateRunpaModules < ActiveRecord::Migration
  def change
    create_table :runpa_modules do |t|
      t.string :name
      t.timestamps
    end
  end
end
