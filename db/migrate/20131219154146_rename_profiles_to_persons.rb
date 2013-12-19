class RenameProfilesToPersons < ActiveRecord::Migration
  def self.up
    rename_table :profiles, :people
  end

  def self.down
    rename_table :people, :profiles
  end
end
