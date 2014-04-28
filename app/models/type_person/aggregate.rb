class Aggregate < PeopleRegister
  default_scope where( type_person: 'aggregate' ).order('people_registers.id ASC')
  accepts_nested_attributes_for :person, reject_if: lambda { |p| p[:name].blank? }
end
