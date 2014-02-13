class Capital < ActiveRecord::Base
  default_scope order('capitals.created_at ASC')

  belongs_to :land
  has_one :register, through: :land
  
  attr_accessible :capital_item, :current_value, :land_id, :lifespan_future, :start_year
end