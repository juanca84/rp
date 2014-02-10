class Community < ActiveRecord::Base
  attr_accessible :code, :name, :province_id

  default_scope order("name ASC")

  belongs_to :province
  has_many :regions_users, as: :regionable
  has_many :people_born, class_name: Person, foreign_key: :community_of_birth_id
  has_many :emission_registers, class_name: Register, foreign_key: :emission_community_id
 
  has_many :lands 
end
