class Entry < ActiveRecord::Base
  attr_accessible :ghoul_attributes
  validate :ghoul_must_be_living, :on => :create
  validate :ghoul_must_unique_for_owner_and_pool, :on => :create
  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  belongs_to :ghoul
  belongs_to :pool
  has_one :rule, :through => :pool
  accepts_nested_attributes_for :ghoul
  
  def value
    return 0 if ghoul.died_on.blank?
    days_alive = ghoul.died_on - ghoul.born_on
    return days_alive if rule.blank?
    function = rule.function.gsub(':days_alive', days_alive.to_s)
    instance_eval(function)
  end
  
  def ghoul_must_be_living
    errors.add(:ghoul, "must be alive") unless ghoul.alive?
  end
  
  def ghoul_must_unique_for_owner_and_pool
    return if ghoul.id.blank?
    pool.user_entries(owner).each do |entry|
      if entry.ghoul.id == ghoul.id
        errors.add(:ghoul, "already chosen")
        break
      end
    end
  end
end
