class Land < ActiveRecord::Base
  belongs_to :community
  belongs_to :department
  belongs_to :register

  has_many :capitals, dependent: :destroy
  has_many :productions, dependent: :destroy

  accepts_nested_attributes_for :capitals, reject_if: lambda { |a| a[:capital_item].blank? }, allow_destroy: true
  accepts_nested_attributes_for :productions, reject_if: lambda { |a| a[:entry].blank? }, allow_destroy: true


  attr_accessible :another_community, :community_id, :department_id,  :disassemble_without_permission, :surface, 
                  :tenure, :unit_of_measure, #campos para el modelo tierras

                  :eventual_labor, :men_per_year_eventually, :men_per_year_own, :men_per_year_total, :own_labor, 
                  :permanent_labor, #campos para el modelo trabajo

                  :capitals_attributes, #campos para el modelo capital
                  
                  :productions_attributes #campos para el modelo producción agricultura
end