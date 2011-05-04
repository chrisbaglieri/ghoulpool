class Pool < ActiveRecord::Base
  attr_accessible :name, :description, :picks
  validates_presence_of :name, :picks
  validates_numericality_of :picks, :greater_than => 0
  has_many :entries
  has_one :rule
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_and_belongs_to_many :users
  before_create :add_owner_as_member
  
  def owned_by? owner
    self.user_id == owner.id
  end
  
  def points
    score = 0
    entries.each { |entry| score += entry.points }
    score
  end
  
  def add_owner_as_member
    users << owner
  end
end
