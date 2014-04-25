class EconomicActivity < ActiveRecord::Base
  attr_accessible :code, :name
  default_scope order("code ASC")

  #validates :name, :code, presence: true
  #validates :name, :code, uniqueness: true 

  has_many :first_partnerships, class_name: Partnership, foreign_key: :economic_activity_1_id
  has_many :second_partnerships, class_name: Partnership, foreign_key: :economic_activity_2_id
end