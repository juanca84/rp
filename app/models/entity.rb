class Entity < ActiveRecord::Base
  attr_accessible :business_name, :code, :description
  has_many :users
end