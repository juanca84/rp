class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
