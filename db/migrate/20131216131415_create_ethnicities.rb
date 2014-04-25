class CreateEthnicities < ActiveRecord::Migration
  def change
    create_table :ethnicities do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
