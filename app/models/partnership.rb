class Partnership < ActiveRecord::Base
  attr_accessible :code, :name

  has_many :partnerships_registers
  has_many :registers, through: :partnerships_registers 
end