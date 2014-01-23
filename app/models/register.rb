#encoding: UTF-8
class Register < ActiveRecord::Base
  attr_accessible :code, :holders_attributes, :sons_attributes, :aggregates_attributes, :civil_union_id, :residence, :address, :community_id, :department_id, :geodesic_ns, :geodesic_ew

  belongs_to :civil_union
  belongs_to :community
  belongs_to :department

  has_many :people_registers
  has_many :people, through: :people_registers

  has_many :aggregates
  has_many :holders
  has_many :sons

  validates :code, presence: true, uniqueness: true
  validate :validate_holders

  accepts_nested_attributes_for :holders
  accepts_nested_attributes_for :sons
  accepts_nested_attributes_for :aggregates

  before_validation :generate_code

  #método para validar el numero de holders
  def validate_holders
    debugger
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
