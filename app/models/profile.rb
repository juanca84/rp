class Profile < ActiveRecord::Base
  attr_accessible :birthdate, :first_lastname, :identification, :name, :second_lastname, :sex
end
