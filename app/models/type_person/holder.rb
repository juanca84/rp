class Holder < PeopleRegister
  default_scope where( type_person: 'holder' )
  validates :person, associated: true

  accepts_nested_attributes_for :person#, reject_if: lambda { |h| h[:name].blank? }
end
