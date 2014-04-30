class Education < ActiveRecord::Base
  default_scope order("educations.code ASC")
  attr_accessible :code, :name
  
  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true 
end