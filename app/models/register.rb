class Register < ActiveRecord::Base
  attr_accessible :code, :holders_attributes, :education_id, :ethnicity_id

  has_many :people_registers
  has_many :people, through: :people_registers
  has_many :holders
  has_many :sons
  has_many :aggregates

  accepts_nested_attributes_for :holders
  accepts_nested_attributes_for :sons
  accepts_nested_attributes_for :aggregates

end
