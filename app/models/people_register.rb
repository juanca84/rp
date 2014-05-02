class PeopleRegister < ActiveRecord::Base
  default_scope order('people_registers.id ASC')
  TYPES = %w( holder son aggregate )
  belongs_to :person, dependent: :destroy, include: [:department_of_birth, :province_of_birth, :community_of_birth]
  belongs_to :register

  has_paper_trail
    
  attr_accessible :type_person, :person_attributes, :register_id, :time_to_land

end