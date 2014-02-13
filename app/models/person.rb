class Person < ActiveRecord::Base
  SEX = %w(M F)

  default_scope order('people.created_at ASC')

  attr_accessible :age, :birthdate, :community_of_birth_id, :civil_status_id, :education_id, :first_lastname, :identification, 
                  :name, :phone, :people_registers_attributes, :sex

  belongs_to :type_identification
  belongs_to :education
  belongs_to :civil_status
  
  belongs_to :community_of_birth, class_name: Community

  has_many :people_registers
  has_many :registers, through: :people_registers

  validates :name, presence: true
end