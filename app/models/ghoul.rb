class Ghoul < ActiveRecord::Base
  attr_accessible :freebase_id
  validates_presence_of :freebase_id, :name, :born_on
  validates_uniqueness_of :freebase_id, :name
  has_many :entries
  
  scope :living, where(:died_on => nil)
  scope :recent, lambda { |date| where("died_on > ?", date) }
  
  def alive?
    return @alive if defined?(@alive)
    if self.died_on.blank?
      args = { "type" => "/people/deceased_person", "id" => "#{self.freebase_id}" }
      matches = Ghoul.query_freebase(args)
      @alive = matches.blank?
    else
      @alive = false
    end
    @alive
  end
  
  def sync
    args = { 
      "type" => "/people/person", 
      "id" => self.freebase_id,
      "date_of_birth" => nil, 
      "name" => nil,
      "/people/deceased_person/date_of_death" => nil 
    }
    matches = Ghoul.query_freebase(args)
    match_found = false
    unless matches.blank?
      match_found = true
      match = matches[0] # assume first hit
      self.name = match["name"]
      self.born_on = match["date_of_birth"]
      self.died_on = match["/people/deceased_person/date_of_death"]
    end
    match_found
  end
  
  def self.search(name)
    args = { "type" => "/people/person", "name" => "#{name}", "id" => nil, "date_of_birth" => nil }
    matches = Ghoul.query_freebase(args)
    ghouls = []
    matches.each do |match|
      ghoul = Ghoul.new
      ghoul.freebase_id = match["id"]
      ghoul.name = match["name"]
      ghoul.born_on = match["date_of_birth"]
      ghouls << ghoul
    end
    ghouls
  end
  
  def deliver_change_notifications
    users = Hash.new
    self.entries.includes(:owner).each do |entry|
      users[entry.owner.id] = entry.owner
    end
    users.each_value do |user|
      UserMailer.deliver_ghoul_change_notification(user)
    end
  end
  
  private
  
  def self.query_freebase(args)
    Ken.session.mqlread([args])
  end
end
