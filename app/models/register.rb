class Register < ActiveRecord::Base
  attr_accessible :code

  has_many :people_registers
  has_many :people, through: :people_registers
end
