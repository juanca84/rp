class PeopleRegister < ActiveRecord::Base
  TYPES = %w( holder1 holder2 son attache )
  belongs_to :person
  belongs_to :register
  attr_accessible :type_person
end
