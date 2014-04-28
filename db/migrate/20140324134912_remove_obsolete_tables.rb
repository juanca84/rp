class RemoveObsoleteTables < ActiveRecord::Migration
  def up
    drop_table :ethnicities
    drop_table :type_identifications
  end

  def down
  end
end
