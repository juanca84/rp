class ProfileUser < ActiveRecord::Base
  belongs_to :user
  attr_accessible :birthdate, :identification, :last_name, :name, :sex
end
