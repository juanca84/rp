class CreateEconomicActivities < ActiveRecord::Migration
  def change
    create_table :economic_activities do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
