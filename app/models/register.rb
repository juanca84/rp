#encoding: UTF-8
class Register < ActiveRecord::Base
  paginates_per 10

  include AASM
  
  attr_accessible :address, :aggregates_attributes, :agricultural_productions_attributes, :capitals_attributes,
                  :code_ine, :community_id, :department_id, :economic_activity_id, :emission_community_id, :emission_date, :emission_department_id, 
                  :first_entry, :geodesic_ew, :geodesic_ns, :holders_attributes, :lands_attributes, :partnerships_attributes, :productions_attributes, :residence, 
                  :second_entry, :sons_attributes, :user_id, :works_attributes

  belongs_to :civil_union
  belongs_to :economic_activity
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

  validates :user_id,  presence: true
  validates :code, presence: true, uniqueness: true, if: lambda { |o| o.finished? }
  validate :validate_holders

  accepts_nested_attributes_for :holders

  accepts_nested_attributes_for :aggregates, :sons, reject_if: lambda { |a| a[:person_attributes].blank? || (a[:person_attributes].present? && a[:person_attributes][:name].blank?) }, allow_destroy: true

  accepts_nested_attributes_for :lands, reject_if: lambda { |a| a[:department_id].blank? && a[:department_id].blank? && a[:capitals_attributes].blank? && a[:productions_attributes].blank? && a[:own_labor].blank? }, allow_destroy: true
  
  accepts_nested_attributes_for :partnerships, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true

  #before_save :uppercase_fields
  before_validation :add_code

  #maquina de estados
  aasm_column :status

  aasm do
    state :step_holder, initial: true
    state :step_family
    state :step_partnership
    state :step_factors
    state :finished

    event :fill_family do
      transitions from: :step_holder, to: :step_family
    end

    event :fill_partnership do
      transitions from: :step_family, to: :step_partnership
    end

    event :fill_factors do
      transitions from: :step_partnership, to: :step_factors
    end

    event :finish do
      transitions from: :step_factors, to: :finished
    end
  end

  #método para validar el numero de holders
  def validate_holders
    if holders.length < 1  
      errors.add(:holders, "Por lo menos debe existir un titular.")
    elsif holders.length > 2
      errors.add(:holders, "Más de 2 titulares.")
    end
  end

  #adicionar código
  def add_code
    if finished? && code.blank?
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

  #metodo para convertir todo los campos a mayusculas
  def uppercase_fields
      self.address.upcase! if address.present?
      self.residence.upcase! if residence.present?
      self.geodesic_ns.upcase! if geodesic_ns.present?
      self.geodesic_ew.upcase! if geodesic_ew.present?
      self.code_ine.upcase! if residence.present?
      self.first_entry.upcase! if first_entry .present?
      self.second_entry.upcase! if second_entry.present?
  end

end