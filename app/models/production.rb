class Production < ActiveRecord::Base
  default_scope order('productions.created_at ASC')

  belongs_to :land
  has_one :register, through: :land

  attr_accessible :entry, :production_destination, :production_quantity, :production_system, :production_unit, :productive_physical_coverage_amount, :productive_physical_coverage_unit
end