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
      query = { "type" => "/people/deceased_person", "id" => "#{self.freebase_id}" }
      matches = Ken.session.mqlread([query])
      @alive = matches.blank?
    end
    @alive
  end
  
  def self.search(name)
    query = { "type" => "/people/person", "id" => nil, "/common/topic/alias" => "#{name}" }
    matches = Ken.session.mqlread([query])
    freebase_ids = []
    matches.each do |match|
      freebase_ids << match["id"]
    end
    freebase_ids
  end
end
