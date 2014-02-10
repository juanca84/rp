class Department < ActiveRecord::Base
  attr_accessible :code, :name

  default_scope order("name ASC")
  
  has_many :provinces
  has_many :communities, through: :provinces

  has_many :regions_users, as: :regionable
  has_many :users, through: :regions_users
  has_many :emission_registers, class_name: Register, foreign_key: :emission_department_id

  has_many :lands
end