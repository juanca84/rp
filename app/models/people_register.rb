class PeopleRegister < ActiveRecord::Base
  TYPES = %w( holder son aggregate )
  belongs_to :person
  belongs_to :register

  attr_accessible :type_person, :person_attributes, :mothers_name, :time_to_land
  #validates :time_to_land, :type_person, presence: true

  accepts_nested_attributes_for :person
end
