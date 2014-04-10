class Department < ActiveRecord::Base
  attr_accessible :abbreviation, :code, :name 

  default_scope order("name ASC")
  
  has_many :provinces
  has_many :communities, through: :provinces  

  has_many :regions_users, as: :regionable
  has_many :users, through: :regions_users
  has_many :people_born, class_name: Person, foreign_key: :department_of_birth_id
  has_many :people_issued, class_name: Person, foreign_key: :issued_id
  has_many :emission_registers, class_name: Register, foreign_key: :emission_department_id
  has_many :capitals

  has_many :lands
end