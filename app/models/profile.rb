class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :type_of_identification
  belongs_to :issued, class_name: Department
  attr_accessible :birthdate, :identification, :issued_id, :last_name, :name, :second_last_name, :sex, :type_of_identification_id
end