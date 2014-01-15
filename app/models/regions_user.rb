class RegionsUser < ActiveRecord::Base
  attr_accessible :regionable_id, :regionable_type

  belongs_to :user
  belongs_to :regionable, polymorphic: true
end