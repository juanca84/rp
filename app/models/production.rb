#encoding: UTF-8

class Production < ActiveRecord::Base
  default_scope order('productions.created_at ASC')

  has_paper_trail

  belongs_to :land
  has_one :register, through: :land

  attr_accessible :entry, :production_destination, :production_quantity, :production_system, :production_unit, :physical_coverage_amount, :physical_coverage_unit

end