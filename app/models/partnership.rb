class Partnership < ActiveRecord::Base
  belongs_to :register
  attr_accessible :code, :name
end
