class AddMoreFieldsForProductionDestinationToProduction < ActiveRecord::Migration
  def change
    add_column :productions, :consumption, :float, default: 0
    add_column :productions, :national, :float, default: 0
    add_column :productions, :export, :float, default: 0
  end
end
