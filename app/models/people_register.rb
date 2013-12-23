class PeopleRegister < ActiveRecord::Base
  belongs_to :person
  belongs_to :register
  attr_accessible :type_person
end
