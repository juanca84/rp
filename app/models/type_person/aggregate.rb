class Aggregate < PeopleRegister
  default_scope where( type_person: 'aggregate' )
end
