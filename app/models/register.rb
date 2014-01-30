#encoding: UTF-8
class Register < ActiveRecord::Base
  attr_accessible :address, :aggregates_attributes, :agricultural_productions_attributes, :capitals_attributes, :code, 
                  :code_ine, :community_id, :department_id, :emission_community_id, :emission_date, :emission_department_id, 
                  :first_entry, :geodesic_ew, :geodesic_ns, :holders_attributes, :lands_attributes, :partnerships, :residence, 
                  :second_entry, :sons_attributes, :subsector, :user_id, :works_attributes

  belongs_to :civil_union
  belongs_to :emission_community, class_name: Community
  belongs_to :emission_department, class_name: Department
  belongs_to :community
  belongs_to :department
  belongs_to :user

  has_many :agricultural_productions
  has_many :aggregates
  has_many :capitals
  has_many :holders
  has_many :lands
  has_many :sons
  has_many :works

  has_many :people_registers
  has_many :people, through: :people_registers

  has_many :partnerships_registers
  has_many :partnerships, through: :partnerships_registers 

  validates :code, :user_id,  presence: true
  validates :code, uniqueness: true
  validate :validate_holders

  accepts_nested_attributes_for :agricultural_productions, :aggregates, :capitals, :holders, :lands, :partnerships, :sons, :works

  before_validation :generate_code

  #método para validar el numero de holders
  def validate_holders
    if holders.length < 1  
      errors.add(:holders, "Por lo menos debe existir un titular.")
    elsif holders.length > 2
      errors.add(:holders, "Más de 2 titulares.")
    end
  end

  #método para generar codigo de formulario consecuativo y único
  def generate_code
    if new_record?
      self.code = Register.new_code_number
    end
  end

  #método pra crear los identificadores de numero
  def self.new_code_number
    code_number = Register.maximum("code")
    return code_number.nil? ? 1 : code_number + 1
  end
end
