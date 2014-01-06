class RunpaModule < ActiveRecord::Base
  attr_accessible :name

  has_many :roles_runpa_modules
  has_many :roles, through: :roles_runpa_modules

  validates :name, uniqueness: true, presence: true
end
