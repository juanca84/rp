class Template < ActiveRecord::Base
  attr_accessible :active, :community_id, :community_of_birth_id, :department_id, :department_of_birth_id, :description, 
                  :emission_community_id, :emission_department_id, :issued_id, :province_of_birth_id, :residence, 
                  :type_residence_id, :user_id
  
  belongs_to :emission_community, class_name: Community
  belongs_to :emission_department, class_name: Department

  belongs_to :community_of_birth, class_name: Community
  belongs_to :department_of_birth, class_name: Department
  belongs_to :issued, class_name: Department
  belongs_to :province_of_birth, class_name: Province
  belongs_to :type_residence  

  belongs_to :community
  belongs_to :department
  belongs_to :user

end
