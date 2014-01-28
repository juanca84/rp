class Land < ActiveRecord::Base
  belongs_to :community
  belongs_to :department
  belongs_to :register

  attr_accessible :another_community, :disassemble_without_permission, :surface, :tenure, :unit_of_measure

end
