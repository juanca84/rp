class Holder < PeopleRegister
  default_scope where( type_person: 'holder' )
end
