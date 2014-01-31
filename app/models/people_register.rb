class PeopleRegister < ActiveRecord::Base
  TYPES = %w( holder son aggregate )
  belongs_to :person
  belongs_to :register

  attr_accessible :type_person, :person_attributes, :time_to_land
  #validates :time_to_land, :type_person, presence: true
end