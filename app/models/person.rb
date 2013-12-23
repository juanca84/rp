class Person < ActiveRecord::Base
  attr_accessible :birthdate, :first_lastname, :identification, :name, :second_lastname, :sex

  belongs_to :type_identification
  belongs_to :ethnicity
  belongs_to :education
  belongs_to :civil_status

  has_many :people_registers
  has_many :registers, through: :people_registers

end
