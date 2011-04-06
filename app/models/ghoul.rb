class Ghoul < ActiveRecord::Base
  attr_accessible :name, :born_on
  
  validates_presence_of :name, :born_on
  validates_uniqueness_of :name
  validates_uniqueness_of :freebase_id
end
