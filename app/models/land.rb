class Land < ActiveRecord::Base
  belongs_to :register
  attr_accessible :disassemble_without_permission, :surface, :tenure, :unit_of_measure
end
