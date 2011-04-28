class Rule < ActiveRecord::Base
  attr_accessible :function
  validates_presence_of :function
  belongs_to :pool
  has_one :entry, :through => :pool
end
