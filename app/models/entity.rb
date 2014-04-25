class Entity < ActiveRecord::Base
  attr_accessible :business_name, :description, :name
  has_many :users
end