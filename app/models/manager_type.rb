class ManagerType < ActiveRecord::Base
  default_scope order("manager_types.id ASC")
  attr_accessible :code, :name
  has_one :register
end