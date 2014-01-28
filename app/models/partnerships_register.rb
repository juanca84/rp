class PartnershipsRegister < ActiveRecord::Base
  belongs_to :register
  belongs_to :partnership
  # attr_accessible :title, :body
end
