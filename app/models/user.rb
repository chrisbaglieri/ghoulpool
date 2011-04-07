class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :entries
  has_many :pools, :through => :entries
  has_many :subordinates, :class_name => "Pool", :foreign_key => "user_id"
end
