class AddParentTypeToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :parent_type, :string
  end
end
