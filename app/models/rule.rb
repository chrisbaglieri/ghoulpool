class Rule < ActiveRecord::Base
  validates_presence_of :function
  belongs_to :pool
  has_one :entry, :through => :pool
end
