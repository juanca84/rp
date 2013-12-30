class Community < ActiveRecord::Base
  attr_accessible :code, :name, :province_id

  belongs_to :province
end
