class Son < PeopleRegister
  default_scope where( type_person: 'son' )

  #adicionar mas validaciones
  accepts_nested_attributes_for :person, reject_if: lambda { |p| p[:name].blank? }
end