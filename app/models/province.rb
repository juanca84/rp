class Province < ActiveRecord::Base
  attr_accessible :code, :name, :department_id

  belongs_to :department
  has_many :communities
  
  has_many :regions_users, as: :regionable
  has_many :people_born, class_name: Person, foreign_key: :province_of_birth_id
end
