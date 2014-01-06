class Role < ActiveRecord::Base
  scopify

  attr_accessible :name, :runpa_module_ids

  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  has_many :roles_runpa_modules
  has_many :runpa_modules, through: :roles_runpa_modules

  validates :name, uniqueness: true, presence: true
end
