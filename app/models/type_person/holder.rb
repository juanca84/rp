class Holder < PeopleRegister
  default_scope where( type_person: 'holder' ).order('people_registers.id ASC')
  validates :person, associated: true

  #parent_id: :register_id

  accepts_nested_attributes_for :person#, reject_if: lambda { |h| h[:name].blank? }
end