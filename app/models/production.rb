#encoding: UTF-8
class Production < ActiveRecord::Base
  default_scope order('productions.id ASC')

  has_paper_trail

  belongs_to :register
  belongs_to :community
  belongs_to :department

  attr_accessible :community_id, :consumption, :department_id, :entry, :export, :production_system,
  				  :production_quantity,:production_unit, :physical_coverage_amount, :national, 
  				  :physical_coverage_unit, :register_id
end