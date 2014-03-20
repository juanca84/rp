class PeopleRegister < ActiveRecord::Base
  default_scope order('people_registers.created_at ASC')
  TYPES = %w( holder son aggregate )
  belongs_to :person, dependent: :destroy
  belongs_to :register

  has_paper_trail
    
  attr_accessible :type_person, :person_attributes, :register_id, :time_to_land

end