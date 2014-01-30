class Land < ActiveRecord::Base
  belongs_to :community
  belongs_to :department
  belongs_to :register

  attr_accessible :community_id, :department_id, :another_community, :disassemble_without_permission, :surface, :tenure, :unit_of_measure
end
