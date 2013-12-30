class Department < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :departments_users
  has_many :departments, through: :departments_users
end
