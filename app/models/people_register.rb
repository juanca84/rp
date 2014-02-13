class PeopleRegister < ActiveRecord::Base
  TYPES = %w( holder son aggregate )
  belongs_to :person, dependent: :destroy
  belongs_to :register

  attr_accessible :type_person, :person_attributes, :time_to_land

  #validates :person, presence: true
end