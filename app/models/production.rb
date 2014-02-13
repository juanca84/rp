class Production < ActiveRecord::Base
  belongs_to :land
  has_one :register, through: :land

  attr_accessible :entry, :production_destination, :production_quantity, :production_system, :production_unit, :productive_physical_coverage_amount, :productive_physical_coverage_unit
end