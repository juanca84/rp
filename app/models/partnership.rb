#encoding: UTF-8

class Partnership < ActiveRecord::Base
  attr_accessible :code, :name
  has_paper_trail
  
  belongs_to :register
  #has_many :partnerships_registers
  #has_many :registers, through: :partnerships_registers

end