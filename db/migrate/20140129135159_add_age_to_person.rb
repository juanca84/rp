class AddAgeToPerson < ActiveRecord::Migration
  def change
    add_column :people, :age, :integer
  end
end
