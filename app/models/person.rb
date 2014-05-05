class Person < ActiveRecord::Base
  SEX = %w(M F)

  has_paper_trail

  default_scope order('people.id ASC')

  attr_accessible :age, :birthdate, :birthplace, :community_of_birth_id, :civil_status_id, :department_of_birth_id ,:education_id, 
                  :first_lastname, :identification, :issued_id, :name, :phone, :province_of_birth_id, :people_registers_attributes, 
                  :second_lastname, :sex, :type_of_identification_id

  belongs_to :type_of_identification
  belongs_to :education
  belongs_to :civil_status
  
  belongs_to :community_of_birth, class_name: Community
  belongs_to :department_of_birth, class_name: Department
  belongs_to :issued, class_name: Department
  belongs_to :province_of_birth, class_name: Province

  has_many :people_registers
  has_many :registers, through: :people_registers

  has_one :owner
  has_one :owner_register, through: :owner, source: "register"

  def get_age
    birthdate.present? ? (Date.today.year - birthdate.year) : ''
  end

  def type_class 
    (pr = people_registers.try(:first)).present? && pr.type_class
  end

  #metodo para obtener el registro
  def register
    registers.first
  end 
end