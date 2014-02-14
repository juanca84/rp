#encoding: UTF-8
class Register < ActiveRecord::Base
  paginates_per 10
  
  attr_accessible :address, :aggregates_attributes, :agricultural_productions_attributes, :capitals_attributes, :code, 
                  :code_ine, :community_id, :department_id, :economic_activity_id, :emission_community_id, :emission_date, :emission_department_id, 
                  :first_entry, :geodesic_ew, :geodesic_ns, :holders_attributes, :lands_attributes, :partnerships_attributes, :productions_attributes, :residence, 
                  :second_entry, :sons_attributes, :user_id, :works_attributes

  belongs_to :civil_union
  belongs_to :emission_community, class_name: Community
  belongs_to :emission_department, class_name: Department
  belongs_to :community
  belongs_to :department
  belongs_to :user

  has_many :aggregates, dependent: :destroy
  #has_many :capitals, through: :lands
  has_many :holders, dependent: :destroy
  has_many :lands, dependent: :destroy
  has_many :sons, dependent: :destroy
  #has_many :productions, through: :lands
  #has_many :works

  has_many :people_registers, dependent: :destroy
  has_many :people, through: :people_registers

  #has_many :partnerships_registers
  #has_many :partnerships, through: :partnerships_registers 
  has_many :partnerships, dependent: :destroy

  validates :code, :user_id,  presence: true
  validates :code, uniqueness: true
  validate :validate_holders

  accepts_nested_attributes_for :holders

  accepts_nested_attributes_for :aggregates, :sons, reject_if: lambda { |a| a[:person_attributes].blank? || (a[:person_attributes].present? && a[:person_attributes][:name].blank?) }, allow_destroy: true

  accepts_nested_attributes_for :lands, reject_if: lambda { |a| a[:department_id].blank? && a[:department_id].blank? && a[:capitals_attributes].blank? && a[:productions_attributes].blank? && a[:own_labor].blank? }, allow_destroy: true
  
  accepts_nested_attributes_for :partnerships, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true

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

  #método para crear los identificadores de numero
  def self.new_code_number
    code_number = Register.maximum("code")
    return code_number.nil? ? 1 : code_number + 1
  end

  #método para determinar la sumatoria de los dias 
  def total_time_to_land
    total = 0
    people_registers.pluck(:time_to_land).each do |time|
      total += time if time.present?
    end
    total
  end
end