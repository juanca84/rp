class Province < ActiveRecord::Base
  attr_accessible :code, :name, :department_id

  belongs_to :department
  has_many :communities
  
  has_many :regions_users, as: :regionable
end
