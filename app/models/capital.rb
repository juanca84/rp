class Capital < ActiveRecord::Base
  default_scope order('capitals.created_at ASC')

  has_paper_trail

  belongs_to :land
  has_one :register, through: :land
  
  attr_accessible :capital_item, :current_value, :land_id, :lifespan_future, :start_year

  def type_class
    'CAPITAL'
  end
end