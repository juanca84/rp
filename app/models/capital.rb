class Capital < ActiveRecord::Base
  default_scope order('capitals.created_at ASC')

  has_paper_trail

  #belongs_to :land
  belongs_to :register
  belongs_to :community
  belongs_to :department
  #has_one :register, through: :land
  
  attr_accessible :capital_item, :community_id, :current_value, :department_id, :land_id, :lifespan_future, :register_id, :start_year

end