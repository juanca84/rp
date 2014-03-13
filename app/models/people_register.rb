class PeopleRegister < ActiveRecord::Base
  TYPES = %w( holder son aggregate )
  belongs_to :person, dependent: :destroy
  belongs_to :register

  has_paper_trail
    
  attr_accessible :type_person, :person_attributes, :register_id, :time_to_land

  def type_class
    type_person == 'holder' ? 'Titular' : type_person == 'son' ? 'Hijo' : type_person == 'aggregate' ? 'Aggregado' : ''     
  end
end