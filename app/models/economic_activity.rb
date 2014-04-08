class EconomicActivity < ActiveRecord::Base
  attr_accessible :code, :name
  default_scope order("code ASC")

  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true 
end