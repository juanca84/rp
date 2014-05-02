class EconomicActivity < ActiveRecord::Base
  attr_accessible :code, :name
  default_scope order("economic_activities.code ASC")

  #validates :name, :code, presence: true
  #validates :name, :code, uniqueness: true 

  has_many :first_partnerships_1, class_name: Partnership, foreign_key: :economic_activity_1_1_id
  has_many :first_partnerships_2, class_name: Partnership, foreign_key: :economic_activity_1_2_id
  has_many :second_partnerships_1, class_name: Partnership, foreign_key: :economic_activity_2_1_id
  has_many :second_partnerships_2, class_name: Partnership, foreign_key: :economic_activity_2_2_id
end