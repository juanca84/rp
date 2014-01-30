class Department < ActiveRecord::Base
  attr_accessible :code, :name
  
  has_many :regions_users, as: :regionable
  has_many :users, through: :regions_users
  has_many :emission_registers, class_name: Register, foreign_key: :emission_department_id

  has_many :lands
end
