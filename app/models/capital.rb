class Capital < ActiveRecord::Base
  belongs_to :department
  belongs_to :community
  belongs_to :register
  attr_accessible :capital_item, :current_value, :lifespan_future, :start_year
end
