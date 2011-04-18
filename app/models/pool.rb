class Pool < ActiveRecord::Base
  attr_accessible :name, :description, :picks
  validates_presence_of :name, :picks
  has_many :entries
  has_one :rule
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_and_belongs_to_many :users
  
  def owned_by? owner
    self.user_id == owner.id
  end
  
  def before_create
    users << owner
  end
end
