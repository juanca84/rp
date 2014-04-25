class AddCodeIneToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :code_ine, :string
  end
end
