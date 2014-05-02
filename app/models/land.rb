class Land < ActiveRecord::Base
  default_scope order('lands.created_at ASC')

  has_paper_trail

  belongs_to :community
  belongs_to :department
  belongs_to :register

  has_many :capitals, dependent: :destroy
  has_many :productions, dependent: :destroy

  accepts_nested_attributes_for :capitals, reject_if: lambda { |a| a[:capital_item].blank? }, allow_destroy: true
  accepts_nested_attributes_for :productions, reject_if: lambda { |a| a[:entry].blank? }, allow_destroy: true


  attr_accessible :another_community, :community_id, :department_id, :ine_code, :surface, 
                  :tenure, :unit_of_measure #campos para el modelo tierras
end