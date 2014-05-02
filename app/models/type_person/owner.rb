class Owner < PeopleRegister
  default_scope where( type_person: 'owner' ).order('people_registers.id ASC')
  validates :person, associated: true

  accepts_nested_attributes_for :person
end