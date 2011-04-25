class Ghoul < ActiveRecord::Base
  attr_accessible :name, :born_on
  validates_presence_of :name, :born_on
  validates_uniqueness_of :name
  validates_uniqueness_of :freebase_id
  has_many :entries
  
  def alive?
    return @alive if defined?(@alive)
    @alive = true
    if self.died_on.blank?
      args = { "type" => "/people/deceased_person", "id" => "#{self.freebase_id}" }
      matches = Ghoul.query_freebase(args)
      @alive = matches.blank?
    end
    @alive
  end
  
  def sync
    args = { 
      "type" => "/people/person", 
      "id" => "#{self.freebase_id}",
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
    args = { "type" => "/people/person", "/common/topic/alias" => "#{name}", "id" => nil }
    matches = Ghoul.query_freebase(args)
    freebase_ids = []
    matches.each { |match| freebase_ids << match["id"] }
    freebase_ids
  end
  
  private
  
  def self.query_freebase(args)
    Ken.session.mqlread([args])
  end
end
