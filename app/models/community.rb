class Community < ActiveRecord::Base
  attr_accessible :code, :name, :province_id

  belongs_to :province
  has_many :regions_users, as: :regionable
end
