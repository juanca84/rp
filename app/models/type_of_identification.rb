class TypeOfIdentification < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :people
end
