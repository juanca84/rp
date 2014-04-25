class CivilStatus < ActiveRecord::Base
  default_scope order('civil_statuses.name ASC')
  attr_accessible :code, :name

  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true 
end
