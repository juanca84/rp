class Holder < PeopleRegister
  default_scope where( type_person: 'holder' ).order('people_registers.created_at ASC')
  validates :person, associated: true

  accepts_nested_attributes_for :person#, reject_if: lambda { |h| h[:name].blank? }
end