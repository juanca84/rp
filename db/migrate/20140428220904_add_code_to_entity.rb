class AddCodeToEntity < ActiveRecord::Migration
  def change
    add_column :entities, :code, :string
  end
end
