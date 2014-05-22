class AddIndividualProducerToRegister < ActiveRecord::Migration
  def change
    add_column :registers, :individual_producer, :boolean, default: true 
  end
end