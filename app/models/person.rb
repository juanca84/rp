class Person < ActiveRecord::Base
  SEX = %w(M F)
  attr_accessible :birthdate, :first_lastname, :identification, :name, :second_lastname, :sex

  belongs_to :type_identification
  belongs_to :ethnicity
  belongs_to :education
  belongs_to :civil_status

  has_many :people_registers
  has_many :registers, through: :people_registers

  accepts_nested_attributes_for :people_registers
  accepts_nested_attributes_for :registers

end
