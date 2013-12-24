class Province < ActiveRecord::Base
  belongs_to :department
  attr_accessible :code, :name
end
