class AddSecondLastNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :second_last_name, :string
  end
end
