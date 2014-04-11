#encoding: UTF-8

class Partnership < ActiveRecord::Base
  attr_accessible :code, :name
  attr_accessible :community_legal_status, :community_name, :economic_activity_1_id, :economic_activity_2_id, :first_entry_1, :first_entry_2,
                  :greater_community, :productive_legal_status_1, :productive_legal_status_2 ,:productive_name_1, :productive_name_2, :second_entry_1, :second_entry_2
  has_paper_trail
  
  belongs_to :register
  belongs_to :economic_activity_1, class_name: EconomicActivity
  belongs_to :economic_activity_2, class_name: EconomicActivity
  #has_many :partnerships_registers
  #has_many :registers, through: :partnerships_registers

end