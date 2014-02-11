class Land < ActiveRecord::Base
  belongs_to :community
  belongs_to :department
  belongs_to :register

  attr_accessible :another_community, :community_id, :department_id,  :disassemble_without_permission, :surface, 
                  :tenure, :unit_of_measure, #campos para el modelo tierras

                  :eventual_labor, :men_per_year_eventually, :men_per_year_own, :men_per_year_total, :own_labor, 
                  :permanent_labor, #campos para el modelo trabajo

                  :capital_item, :current_value, :lifespan_future, :start_year, #campos para el modelo capital
                  
                  :entry, :production_destination, :production_quantity, :production_system, :production_unit, 
                  :productive_physical_coverage_amount, :productive_physical_coverage_unit #campos para el modelo producción agricultura
end