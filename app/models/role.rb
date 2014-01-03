class Role < ActiveRecord::Base
  scopify

  attr_accessible :name, :resource_type

  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  has_many :runpa_modules

  validates :name, uniqueness: true, presence: true

  accepts_nested_attributes_for :runpa_modules

end
