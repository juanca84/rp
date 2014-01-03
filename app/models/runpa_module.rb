class RunpaModule < ActiveRecord::Base
  belongs_to :role
  attr_accessible :name

  validates :name, uniqueness: true, presence: true
end
