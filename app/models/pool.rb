class Pool < ActiveRecord::Base
  attr_accessible :name, :description
  validates_presence_of :name
  has_many :entries
  has_many :users, :through => :entries
  has_one :rule
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
end
