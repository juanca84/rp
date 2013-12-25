class PeopleRegister < ActiveRecord::Base
  TYPES = %w( holder son aggregate )
  belongs_to :person
  belongs_to :register

  attr_accessible :type_person, :person_attributes
  validates :person_id, :register_id, :type_person, presence: true

  accepts_nested_attributes_for :person
end
