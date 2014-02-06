class AgriculturalProduction < ActiveRecord::Base
  belongs_to :department
  belongs_to :community
  belongs_to :register
  attr_accessible :community_id, :department_id, :entry, :production_destination, :production_quantity, :production_system, :production_unit, :productive_physical_coverage_amount, :productive_physical_coverage_unit
end
