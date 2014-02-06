class RemoveBirthdateFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :birthdate
  end

  def down
    add_column :profiles, :birthdate, :string
  end
end
