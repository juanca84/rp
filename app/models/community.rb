class Community < ActiveRecord::Base
  belongs_to :province
  attr_accessible :code, :name
end
