class Son < PeopleRegister
  default_scope where( type_person: 'son' )
end
