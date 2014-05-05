class CreateManagerTypes < ActiveRecord::Migration
  def change
    create_table :manager_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
