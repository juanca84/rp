class Holder < PeopleRegister
  default_scope where( type_person: 'holder' ).order('people_registers.created_at ASC')
  validates :person, associated: true

  has_paper_trail do |register|
    debugger
    puts  'jsjsj'
  end
  #parent_id: :register_id

  accepts_nested_attributes_for :person#, reject_if: lambda { |h| h[:name].blank? }
end