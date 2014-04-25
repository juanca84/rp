class RolesRunpaModule < ActiveRecord::Base
  belongs_to :role
  belongs_to :runpa_module
  # attr_accessible :title, :body
  validates_uniqueness_of :role_id, scope: :runpa_module_id
end
