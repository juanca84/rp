class EconomicActivity < ActiveRecord::Base
  attr_accessible :code, :name

  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true 
end
