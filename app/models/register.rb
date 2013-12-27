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

  accepts_nested_attributes_for :holders
  accepts_nested_attributes_for :sons
  accepts_nested_attributes_for :aggregates

end
