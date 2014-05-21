class Template < ActiveRecord::Base

  attr_accessible :user_id, :active, :description, :department_id, :province_id, :community_id, :type_residence_id, :residence, 
                  :oecom_name, :legal_status_oecom, :greater_oecom_name
  
  belongs_to :type_residence  

  belongs_to :province
  belongs_to :community
  belongs_to :department
  belongs_to :user
  
  validates :description, presence: true
end