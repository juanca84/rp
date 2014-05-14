#encoding: UTF-8

class Partnership < ActiveRecord::Base
  attr_accessible :code, :name
  attr_accessible :community_legal_status, :community_name, :economic_activity_1_1_id, :economic_activity_1_2_id, 
                  :economic_activity_2_1_id, :economic_activity_2_2_id, :first_entry_1_1, :first_entry_1_2, :first_entry_2_1, 
                  :first_entry_2_2,:greater_community, :productive_legal_status_1, :productive_legal_status_2,
                  :productive_name_1, :productive_name_2, :second_entry_1_1, :second_entry_1_2, :second_entry_2_1, 
                  :second_entry_2_2,
                  :third_entry_1_1, :third_entry_1_2, :economic_activity_1_3_id, :first_entry_1_3, :second_entry_1_3, 
                  :third_entry_1_3, :third_entry_2_1, :third_entry_2_2, :economic_activity_2_3_id, :first_entry_2_3, 
                  :second_entry_2_3, :third_entry_2_3, 
  has_paper_trail
  
  belongs_to :register
  belongs_to :economic_activity_1_1, class_name: EconomicActivity
  belongs_to :economic_activity_1_2, class_name: EconomicActivity
  belongs_to :economic_activity_1_3, class_name: EconomicActivity
  belongs_to :economic_activity_2_1, class_name: EconomicActivity
  belongs_to :economic_activity_2_2, class_name: EconomicActivity
  belongs_to :economic_activity_2_3, class_name: EconomicActivity
end