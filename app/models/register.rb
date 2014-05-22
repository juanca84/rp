#encoding: UTF-8

class Register < ActiveRecord::Base
  paginates_per 100

  has_paper_trail

  include AASM
  
  attr_accessible :activation_date, :address, :aggregates_attributes, :capitals_attributes, :code_ine, 
                  :community_id, :department_id, :economic_activity_id, :emission_community_id, :emission_date, :emission_department_id, 
                  :individual_producer, :first_entry, :is_owner, :geodesic_ew, :geodesic_ns, :holders_attributes, :lands_attributes,  
                  :manager_type_id, :owner_attributes, :partnership_attributes, :productions_attributes, :residence, 
                  :second_entry, :sons_attributes, :type_residence_id, :user_id, :work_attributes
                    
  belongs_to :economic_activity
  belongs_to :emission_community, class_name: Community
  belongs_to :emission_department, class_name: Department
  belongs_to :community
  belongs_to :department
  belongs_to :manager_type
  belongs_to :user
  belongs_to :type_residence

  has_many :aggregates, dependent: :destroy
  has_many :capitals
  has_many :holders, dependent: :destroy
  has_many :lands, dependent: :destroy
  has_many :sons, dependent: :destroy
  has_one :work

  has_one :owner
  has_one :owner_person, through: :owner, source: "person"
 
  has_many :people_registers, dependent: :destroy
  has_many :people, through: :people_registers

  #has_many :partnerships_registers
  #has_many :partnerships, through: :partnerships_registers
  has_many :productions

  has_one :partnership, dependent: :destroy

  validates :user_id,  presence: true
  validates :code, presence: true, uniqueness: true, if: lambda { |o| o.active? }
  validate :validate_holders

  accepts_nested_attributes_for :holders

  accepts_nested_attributes_for :aggregates, :sons, reject_if: lambda { |a| a[:person_attributes].blank? || (a[:person_attributes].present? && a[:person_attributes][:name].blank?) }, allow_destroy: true

  accepts_nested_attributes_for :capitals, reject_if: lambda { |a| a[:department_id].blank? && a[:community_id].blank? }, allow_destroy: true
  
  accepts_nested_attributes_for :lands, reject_if: lambda { |a| a[:department_id].blank? && a[:community_id].blank? }, allow_destroy: true
  
  accepts_nested_attributes_for :owner#, reject_if: lambda { |a| a[:person_attributes].blank? || (a[:person_attributes].present? && a[:person_attributes][:name].blank?) }

  accepts_nested_attributes_for :partnership, allow_destroy: true
  
  accepts_nested_attributes_for :productions, reject_if: lambda { |a| a[:department_id].blank? && a[:community_id].blank? }, allow_destroy: true

  accepts_nested_attributes_for :work


  #scope para encontrar los registros que fueron completados es decir que estan en estados 'active' o 'inactive' 
  scope :valid, where("registers.status = ? OR registers.status = ?", 'active', 'inactive')

  #scope para encontar los registros que estan incompletos es decir los que no estan en estado 'active' o 'inactive'
  scope :no_valid, where("registers.status <> ? AND registers.status <> ?", 'active', 'inactive')

  #scope para encontrar los registros de un usuario
  scope :by_user, lambda { |user| where(user_id: (user.present? && user.id) ) }

  #before_save :uppercase_fields
  before_validation :add_code

  #maquina de estados
  aasm_column :status

  aasm do
    state :step_holder, initial: true
    state :step_family
    state :step_partnership
    state :step_factors
    state :active
    state :inactive

    event :fill_family do
      transitions from: :step_holder, to: :step_family
    end

    event :fill_partnership do
      transitions from: :step_family, to: :step_partnership
    end

    event :fill_factors do
      transitions from: :step_partnership, to: :step_factors
    end

    event :activate do
      transitions from: [:step_factors, :inactive], to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
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

  #método para adicionar código y poner la fecha de actualización de la fecha actulización
  def add_code
    if active? && code.blank?
      self.code = Register.new_code_number
      self.activation_date = DateTime.now
    end
  end

  #método para crear los identificadores de numero
  def self.new_code_number
    code_number = Register.maximum("code")
    return code_number.nil? ? 954 : code_number + 1
  end

  #método para determinar la sumatoria de los dias 
  def total_time_to_land
    total = 0
    people_registers.pluck(:time_to_land).each do |time|
      total += time if time.present?
    end
    total
  end

  #metodo para obtener al titular principal
  def holder_main
    holders.includes(:person).first.try(:person)
  end
  
  def holder_alternate
    holders.includes(:person).last.try(:person)
  end

  def summary_holders
    "#{ holders.first.try(:person).try(:name) },\n 
     #{ holders.last.try(:person).try(:name) }"
  end

  def summary_partnerships
    "#{ partnership.try(:productive_name_1) }, #{ partnership.try(:productive_name_2)  }"
  end

  def summary_economic_activity
    economic_activity.try(:name)
  end

  def summary_entries
    "#{ first_entry }, #{ second_entry }"
  end

  def zones
  end

  def total_surface
  end

  def total_production
  end

  def entries_productions(entry = nil)
    result = 
      if entry.present?
        res = productions.search( entry_cont: entry )
        res.result.pluck(:entry)
      else
        productions.pluck(:entry)
      end
    result.uniq.join(', ')
  end

  #método para mostrar la zona de produccion (para el factor de producción Tierra)
  def zone_productions(entry = nil)
    result = 
      if entry.present?
        res = productions.search( entry_cont: entry )
        res.result
      else
        productions
      end
    locations = []
    result.each do |p|
      locations << "#{ p.try(:department).try(:name).upcase rescue "" } - #{ p.try(:community).try(:name).upcase rescue "" }"
    end 
    locations.uniq.join(",")
  end

  #método para generar la superficie total de la tierra
  def surface_productions(entry = nil)
    result = 
      if entry.present?
        res = productions.search( entry_cont: entry )
        res.result
      else
        productions
      end
    total = 0
    result.each do |p|
      total += p.physical_coverage_amount if p.physical_coverage_amount.present?
    end 
    total
  end

  #método para generar el total de la producción
  def total_productions(entry = nil)
    result = 
      if entry.present?
        res = productions.search( entry_cont: entry )
        res.result
      else
        productions
      end
    total = 0
    result.each do |p|
      total += p.production_quantity if p.production_quantity.present?
    end 
    total
  end

  #método para generar un file csv
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def categorization
    if work.present? && work.eventual_labor <= 50 && work.permanent_labor = 0
      "agricultor familiar"
    else
      "agricultor no familiar"
    end  

  end

end