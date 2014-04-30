class TypeOfIdentification < ActiveRecord::Base
  default_scope order("type_of_identifications.code ASC")
  attr_accessible :code, :name
  has_many :people
  has_many :profile
end
