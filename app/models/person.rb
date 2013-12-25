class Person < ActiveRecord::Base
  SEX = %w(M F)
  attr_accessible :birthdate, :first_lastname, :identification, :name, :second_lastname, :sex, :people_registers_attributes, :education_id, :ethnicity_id

  belongs_to :type_identification
  belongs_to :ethnicity
  belongs_to :education
  belongs_to :civil_status

  has_many :holders, through: :people_registers
  has_many :people_registers
  has_many :registers, through: :people_registers

  validates :name, presence: true

end
