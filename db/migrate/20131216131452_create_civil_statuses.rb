class CreateCivilStatuses < ActiveRecord::Migration
  def change
    create_table :civil_statuses do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
