class CreateDepartmentsUsers < ActiveRecord::Migration
  def change
    create_table :departments_users do |t|
      t.references :department
      t.references :user

      t.timestamps
    end
    add_index :departments_users, :department_id
    add_index :departments_users, :user_id
  end
end
