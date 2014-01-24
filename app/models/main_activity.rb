class MainActivity < ActiveRecord::Base
  belongs_to :register
  attr_accessible :level, :summner_entry, :winter_entry
end
