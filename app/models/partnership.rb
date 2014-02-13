class Partnership < ActiveRecord::Base
  attr_accessible :code, :name
  
  belongs_to :register
  #has_many :partnerships_registers
  #has_many :registers, through: :partnerships_registers 
end