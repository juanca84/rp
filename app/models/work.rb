class Work < ActiveRecord::Base
  belongs_to :register
  attr_accessible :eventual_labor, :men_per_year_eventually, :men_per_year_own, :men_per_year_total, :own_labor, :permanent_labor
end
